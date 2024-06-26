import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/NgoLoginPage.dart';
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
      // '/login': (context) => LoginPage(),
      '/signup': (context) => SignUpPage(),
      // '/NGOLoginPage': (context) => NGOLoginPage(),
      '/createAccount': (context) => CreateAccountPage(),
      // '/': (context) => SignUpPage(),
      //'/NgoSignUpPage': (context) => NgoSignUpPage(),
      '/signIn': (context) => LoginPage(),
      '/ngoSignUp': (context) => NgoSignUpPage(),
      // '/ngoLogin': (context) => NgoLoginPage(),
    });
  }
}

class NgoSignUpPage extends StatefulWidget {
  @override
  _NgoSignUpPageState createState() => _NgoSignUpPageState();
}

class _NgoSignUpPageState extends State<NgoSignUpPage> {
  bool _acceptTerms = false;
  bool _passwordVisible = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Retain back button functionality
              },
              child: Image.asset(
                'assets/logooo.png', // Replace with your logo asset
                height: 40,
              ),
            ),
            SizedBox(width: 10),
            Text('Create an Account'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/ngo.png', // Replace with your NGO PNG asset
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 85, 19, 193).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name of the NGO'),
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
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
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
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    if (_confirmPasswordController.text.isNotEmpty)
                      _confirmPasswordController.text ==
                              _passwordController.text
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
                        Expanded(
                          child: Text(
                            'I agree to Terms & Condition and Privacy Policy',
                          ),
                        ),
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
                          Navigator.pushNamed(context, '/NgoHomePage');
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NgoLoginPage()),
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
            ],
          ),
        ),
      ),
    );
  }
}
