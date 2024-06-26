import 'package:anilove/pages/NgoSignUpPage.dart';
import 'package:anilove/pages/NgoLoginPage.dart';
import 'package:anilove/pages/VolSignUpPage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/chooseRole': (context) => ChooseRolePage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/NgoSignUp': (context) => NgoSignUpPage(),
        '/signIn': (context) => LoginPage(),
        '/ngoSignUp': (context) => NgoSignUpPage(),
        '/ngoLogin': (context) => NgoLoginPage()
      },
    );
  }
}

class NGOLoginPage {}

class ChooseRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // This maintains the back functionality
              },
              child: Image.asset(
                'assets/logooo.png',
                fit: BoxFit.contain,
                height: 40,
              ),
            ),
            SizedBox(width: 10),
            Text('Choose Your Role'),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: Container(
        color: Color.fromARGB(
            255, 255, 255, 255), // Set your desired background color here
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0), // To place the cards a little above
                  _buildRoleCard(context, 'User', '/signup'),
                  SizedBox(height: 20.0),
                  _buildRoleCard(context, 'NGO',
                      MaterialPageRoute(builder: (context) => NgoSignUpPage())),
                  SizedBox(height: 20.0),
                  _buildRoleCard(context, 'Volunteer',
                      MaterialPageRoute(builder: (context) => VolSignUpPage())),
                  SizedBox(height: 20.0),
                  _buildRoleCard(context, 'Admin',
                      null), // Adjusted for future admin functionality
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Image.asset(
                'assets/p2.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, String role, dynamic route) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.black,
      child: InkWell(
        onTap: () {
          if (route is String) {
            Navigator.pushNamed(context, route);
          } else if (route is MaterialPageRoute) {
            Navigator.push(context, route);
          }
        },
        child: Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: Text(
            role,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
