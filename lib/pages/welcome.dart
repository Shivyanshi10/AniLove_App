import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/LoginPage.dart';
import 'package:anilove/pages/signuppage.dart';
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
        '/signup': (context) => SignUpPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/signIn': (context) => LoginPage(), // Route for the sign-in page
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Logo.jpg', // Replace with the actual path to your logo image
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(height: 20.0), // Space between the logo and the button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chooseRole');
                },
                child: Text("Start Over"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
