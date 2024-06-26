import 'package:anilove/pages/VolLoginPage.dart';
import 'package:anilove/pages/VolunteerHomePage.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/NGOSignUpPage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => WelcomePage(),
      '/chooseRole': (context) => ChooseRolePage(),
      '/signup': (context) => SignUpPage(),
      '/createAccount': (context) => CreateAccountPage(),
      '/signIn': (context) => LoginPage(),
      '/ngoSignUp': (context) => NgoSignUpPage(),
      '/volSignUp': (context) => VolSignUpPage(),
      '/VolunteerHomePage': (context) => VolunteerHomePage(),
    });
  }
}

class VolSignUpPage extends StatefulWidget {
  @override
  _VolSignUpPage createState() => _VolSignUpPage();
}

class _VolSignUpPage extends State<VolSignUpPage> {
  bool _acceptTerms = false;
  bool _passwordVisible = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Account'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name of the Volunteer'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Live Location'),
              onTap: () {
                // Handle accessing live location
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              onChanged: (value) {
                setState(() {});
              },
            ),
            if (_confirmPasswordController.text.isNotEmpty)
              _confirmPasswordController.text == _passwordController.text
                  ? Text(
                      'Passwords Matched',
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      'Passwords Not Matched',
                      style: TextStyle(color: Colors.red),
                    ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Checkbox(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value!;
                    });
                  },
                ),
                Text('I agree to Terms & Condition and Privacy Policy'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle sign up
                if (_acceptTerms &&
                    _passwordController.text ==
                        _confirmPasswordController.text) {
                  // Navigate to NGO Home Page
                  Navigator.pushNamed(context, '/VolunteerHomePage');
                }
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => VolLoginPage()),
                    );
                  },
                  child: Text(
                    "Join Now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
