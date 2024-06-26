import 'package:anilove/pages/NgoHomePage.dart';
import 'package:anilove/pages/NgoSignUpPage.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:anilove/pages/Homepage.dart';
import 'package:anilove/pages/NgoLoginPage.dart'; // Import your login page file
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
        //'/SaveLifePage': (context) => SaveLifePage(),
        '/ngoSignUp': (context) => NgoSignUpPage(),
        '/ngoLogin': (context) => NgoLoginPage(),
        '/NgoHomePage': (context) => NgoHomePage(),
        '/AllUpdatesPage': (context) => AllUpdatesPage()
      },
    );
  }
}

class AllUpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Updates'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/animal_${index % 5}.jpg'),
                ),
                title: Text('Animal ${index + 1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      'Description of the case...',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.0,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Location ${index + 1}',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Spacer(),
                        Text(
                          index % 2 == 0 ? 'Processing' : 'Completed',
                          style: TextStyle(
                            color:
                                index % 2 == 0 ? Colors.orange : Colors.green,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Time posted: ${getTimePosted(index)}',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle tap on the card
                },
              ),
            ),
          );
        },
      ),
    );
  }

  String getTimePosted(int index) {
    // Placeholder function to return time posted
    // You can replace this with actual time calculation logic
    if (index < 5) {
      return 'A few minutes ago';
    } else if (index < 10) {
      return '1 hour ago';
    } else if (index < 15) {
      return '1 day ago';
    } else {
      return '1 week ago';
    }
  }
}
