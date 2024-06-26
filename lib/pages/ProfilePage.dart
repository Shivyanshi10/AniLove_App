import 'package:flutter/material.dart';
import 'package:anilove/pages/EditProfilePage.dart';
import 'package:anilove/pages/SettingsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ProfilePage(),
        '/editProfile': (context) => EditProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/chooseRole': (context) => ChooseRolePage(),
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String? profilePicture =
      'assets/profileee.png'; // This should be dynamic based on the user's uploaded picture.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(
              color: Colors.black, fontSize: 18), // Increased font size
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: profilePicture != null
                      ? AssetImage(profilePicture!)
                      : AssetImage('assets/default_profile.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Username: Shivyanshi Rai',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  'Email: shivyanshirai10@gmail.com',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white), // Set the text color to white
                  ),
                ),
                // UserAccountsDrawerHeader(
                //   accountName: Text(''),
                //   accountEmail: Text(''),
                //   decoration: BoxDecoration(
                //     color: Colors.transparent,
                //   ),
                // ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('My Contribution'),
                  onTap: () {
                    // Handle My Contribution option
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  onTap: () {
                    // Handle Change Password option
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help and Support'),
                  onTap: () {
                    // Handle Help and Support option
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/chooseRole',
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Role'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      body: Center(
        child: Text('Choose Role Page Content Here'),
      ),
    );
  }
}
