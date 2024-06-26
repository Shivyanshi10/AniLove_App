import 'package:anilove/pages/Homepage.dart';
import 'package:anilove/pages/NgoSignUpPage.dart';
import 'package:anilove/pages/chooserolepage.dart';
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
        '/signup': (context) => SignUpPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/NgoSignUpPage': (context) => NgoSignUpPage(),
        '/signIn': (context) => LoginPage(),
      },
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _agreedToTerms = false;
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                      'assets/profilepic.jpg'), // Replace with your image asset
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 85, 19, 193).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 9,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Full Name *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email ID *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Phone Number *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (value.length != 10) {
                            return 'Please enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.0),
                      PasswordField(),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreedToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreedToTerms =
                                    !_agreedToTerms; // Toggle the checkbox
                                _isAccepted = _agreedToTerms;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              'I agree to the Terms and Conditions and Privacy Policy',
                              style: TextStyle(
                                color: _isAccepted ? null : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _isAccepted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        },
                        child: Text('Sign Up'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            _isAccepted ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Already have an Account? Join Now!',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
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
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password *',
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // Toggle password visibility
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        } else if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
            .hasMatch(value)) {
          return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
        }
        return null;
      },
    );
  }
}
