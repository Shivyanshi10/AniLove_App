import 'package:anilove/pages/SaveLifePage.dart';
import 'package:anilove/pages/VolSignUpPage.dart';
import 'package:anilove/pages/VolunteerHomePage.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/homepage.dart';
import 'package:anilove/pages/signuppage.dart';
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
        '/signup': (context) => SignUpPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/Homepage': (context) => HomePage(),
        '/SaveLifePage': (context) => SaveLifePage(),
        '/volSignUp': (context) => VolSignUpPage(),
        '/volLogin': (context) => VolLoginPage(),
        '/VolunteerHomePage': (context) => VolunteerHomePage(),
      },
    );
  }
}

class VolLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email or Username'),
            ),
            SizedBox(height: 10.0),
            PasswordField(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle sign in
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteerHomePage()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      obscureText: !_isPasswordVisible,
    );
  }
}
