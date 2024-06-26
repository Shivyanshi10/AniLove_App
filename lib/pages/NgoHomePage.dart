import 'package:anilove/pages/welcome.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/AllUpdatesPage.dart';
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
        // '/': (context) => SignUpPage(),
        '/signIn': (context) => LoginPage(), // Route for the sign-in page
        // '/signIn': (context) => SignInPage(),
        '/home': (context) => NgoHomePage(),
        '/AllUpdatesPage': (context) => AllUpdatesPage()
        //'/SaveLifePage': (context) => SaveLifePage()
      },
    );
  }
}

class NgoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AniLove'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle profile button press
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'AniLove',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Latest Updates'),
              onTap: () {
                // Handle Latest Updates press
                Navigator.pop(context); // Close drawer
                // Handle navigation to Latest Updates page
              },
            ),
            ListTile(
              title: Text('Previous Actions'),
              onTap: () {
                // Handle Previous Actions press
                Navigator.pop(context); // Close drawer
                // Handle navigation to Previous Actions page
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'Updates!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AllUpdatesPage()),
                );
              },
              child: Text('See All'),
            ),
            SizedBox(height: 20.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/animal_image_$index.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animal Name',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 5.0),
                                Text('Location Name'),
                                SizedBox(width: 10.0),
                                Text('5 Km away'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
