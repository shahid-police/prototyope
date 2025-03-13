import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
 late String _name = 'Loading...';
 late String _email = 'Loading...';
 late String _role = 'Loading...';
 late String _phone = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

 Future<void> _loadUserData() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();

   if (prefs.containsKey('name')) {
     if (mounted) {
       setState(() {
         _name = prefs.getString('name') ?? 'John Doe';
         _email = prefs.getString('email') ?? 'johndoe@example.com';
         _phone = prefs.getString('phone') ?? '000-000-0000';
         _role = prefs.getString('role') ?? 'Guest';
       });
     }
   } else {
     print("No user data found in SharedPreferences!");
   }
 }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
             // backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual image
            ),
            SizedBox(height: 20),
            Text(
              _name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Role : '+_role,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                _phone,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                _email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:prototyope/login_user.dart';
//
// class UserProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual image
//             ),
//             SizedBox(height: 20),
//             Text(
//               'John Doe',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'johndoe@example.com',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             SizedBox(height: 30),
//             ListTile(
//               leading: Icon(Icons.contact_emergency),
//               title: Text('0333'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('User/Admin'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Loginscreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
