import 'package:anilove/pages/Homepage.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/loginpage.dart';
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
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/signIn': (context) => LoginPage(),
        '/Homepage': (context) => HomePage(),
      },
    );
  }
}

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email ID'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            CheckboxListTile(
              title: Text('I accept the terms and conditions'),
              value: false,
              onChanged: (value) {
                // Handle terms and conditions acceptance
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
