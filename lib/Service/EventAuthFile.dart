import 'dart:convert';
import 'package:http/http.dart'as http show post;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

import '../model/service.dart';



class Eventauthfile {
  final String getservice = "http://localhost/services.php";
  final String gtvenue = "http://localhost/getvenue.php";
  final String gtserType = "http://localhost/getserviceType.php";

///Venue start from here


  Future<List<Map<String, dynamic>>> myVenueData(String gtvenue) async {
    final response = await http.post(Uri.parse(gtvenue));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        return List<Map<String, dynamic>>.from(data['venue']);
      }
      else {
        throw Exception("Failed to load venues: ${data['message'] ?? 'Unknown error'}");
      }
    }
    else {
      throw Exception("Failed to load venues: ${response.statusCode}");
    }
  }



// Service type start from here

  //
  // Future<List<Map<String, dynamic>>> mySType(String gtserType) async {
  //   final response = await http.post(Uri.parse(gtserType));
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     if (data['success']) {
  //       return List<Map<String, dynamic>>.from(data['service']);
  //     }
  //     else {
  //       throw Exception("Failed to load venues: ${data['message'] ?? 'Unknown error'}");
  //     }
  //   }
  //   else {
  //     throw Exception("Failed to load venues: ${response.statusCode}");
  //   }
  // }






  Future<List<dynamic>> myeve(String getservice) async {
    final response = await http.post(Uri.parse(getservice));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] == true) {
         return data['service'];  // 👌 List of services

      } else {
        throw Exception("Failed: ${data['error'] ?? 'Unknown error'}");
      }
    } else {
      throw Exception("Failed to load services");
    }
  }



}
