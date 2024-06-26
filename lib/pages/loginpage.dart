import 'package:anilove/pages/SaveLifePage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:anilove/pages/Homepage.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
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
        '/Homepage': (context) => HomePage(),
        '/SaveLifePage': (context) => SaveLifePage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            Text('Login'),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 85, 19, 193).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                          'assets/loginprofile.jpg'), // Replace with your image asset
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (!RegExp(
                                r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{6,}$')
                            .hasMatch(value)) {
                          return 'Password must contain at least one uppercase letter, one digit, one special character and be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text('Login'),
                      //   onPressed: () {
                      //     // if (_formKey.currentState!.validate()) {
                      //     //   Fluttertoast.showToast(
                      //     //     msg: "Submitted Successfully",
                      //     //     toastLength: Toast.LENGTH_SHORT,
                      //     //     gravity: ToastGravity.BOTTOM,
                      //     //   );
                      //       Navigator.pushNamed(context, '/Homepage');
                      //     }
                      //   child: Text('Login'),
                    ),
                    SizedBox(height: 20.0),
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
