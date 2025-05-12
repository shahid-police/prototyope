
import 'package:flutter/material.dart';
import 'package:prototyope/Register.dart';
import 'package:prototyope/model/user.dart';
import 'package:prototyope/profileScreen.dart';
import 'Model/user.dart';
import 'Service/AuthService.dart';
import 'newprofile.dart';

class Loginscreen extends StatefulWidget{
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<Loginscreen>
{
  final _authService = AuthService();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();




  Future<void> _login() async {
    try {
      print("login");
      var user= await _authService.log(
        _emailController.text,
        _passwordController.text,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Login successful')),
      // );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ComplateProfileScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar:AppBar(title : Text('LoginForm')

        ),

        body: Center(
          child:Padding(
            padding: const EdgeInsets.all(120.0),
              // child: Container(
              //     padding: const EdgeInsets.all(60),

            child: Column(
              children: [

                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),


                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,


                ),

                SizedBox (
                  height: 50,
                  width: 15,

                ),

                ElevatedButton.icon(
                  onPressed: () {
                    print("on pressed");
                    _login();
                                },
                  icon: Icon(Icons.login, color: Colors.blue), // Registration icon
                  label: Text("Sign In"),

                ),

                SizedBox (
                  height: 50,
                  width: 15,

                ),


                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to register screen or perform register action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registerscreen()),
                    );
                  },
                  icon: Icon(Icons.app_registration, color: Colors.blue), // Registration icon
                  label: Text("Sign up if you are not registered"),

                )


              ],
            // )
              )
        )
        )
    );
    throw UnimplementedError();
  }


}
