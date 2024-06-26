import 'package:flutter/material.dart';
import 'package:anilove/pages/NgoHomePage.dart';

class NgoLoginPage extends StatefulWidget {
  @override
  _NgoLoginPageState createState() => _NgoLoginPageState();
}

class _NgoLoginPageState extends State<NgoLoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove default back button
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
            Text('Login'),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              width: double.infinity,
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/ngo.png', // Replace with your profile image asset
                        height: 120,
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Login In as NGO',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle sign in
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NgoHomePage()),
                          );
                        }
                      },
                      child: Text('Sign In'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text('Don\'t have an account? Sign up'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
