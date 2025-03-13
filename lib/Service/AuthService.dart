import 'dart:convert';
import 'package:http/http.dart'as http show post;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

import '../model/user.dart';


class AuthService {
  final String registerUrl = 'http://localhost/register_user.php';
  final String loginUrl = 'http://localhost/login_user.php';

  Future<void> reg(String name, String email, String password,
      String phone) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      //headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }),
    );

    if (response.statusCode == 200) {
      print('User registered successfully');
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }


  //Login start from here

  Future<User?> log(String email, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      // headers: {'Content-Type': 'application/json'},
      body: jsonEncode({

        'email': email,
        'password': password,


      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(
          response.body); // Decode the JSON response
      if (jsonResponse['success'] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('phone', jsonResponse['user']["phone"]);
        await prefs.setString('name', jsonResponse['user']["name"]);
        await prefs.setString('email', jsonResponse['user']["email"]);
        await prefs.setString('role', jsonResponse['user']["role"]);


        return User.fromJson(
            jsonResponse['user']); // Pass the 'user' data to the User.fromJson method
      }
      else
        if (jsonResponse['error'] != null) {
        throw Exception(
            jsonResponse['error']); // Throw an exception with the error message

        }
        else {
        throw Exception('Unknown error occurred');
        }
      }
      else {
      throw Exception('Failed to Login: ${response.statusCode}');
    }
  }
}
