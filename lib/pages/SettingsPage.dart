import 'package:anilove/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/LoginPage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/welcome.dart';

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
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage()
      },
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dark Mode'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/darkMode');
            },
          ),
          ListTile(
            title: Text('Languages'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/language');
            },
          ),
          ListTile(
            title: Text('App Info'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/appInfo');
            },
          ),
        ],
      ),
    );
  }
}
