import 'package:anilove/pages/VolLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:anilove/pages/SaveLifePage.dart';
import 'package:anilove/pages/VolSignUpPage.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/homepage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:url_launcher/url_launcher.dart';

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
        '/Homepage': (context) => HomePage(),
        '/SaveLifePage': (context) => SaveLifePage(),
        '/volSignUp': (context) => VolSignUpPage(),
        '/volLogin': (context) => VolLoginPage(),
        '/VolunteerHomePage': (context) => VolunteerHomePage(),
      },
    );
  }
}

class VolunteerHomePage extends StatelessWidget {
  final List<Map<String, String>> ngos = [
    {
      'name': 'Happy Paws',
      'image': 'assets/ngos/happy_paws.jpg',
      'position': 'Volunteer',
      'location': 'Nearby 5 km away',
      'mapUrl': 'https://www.google.com/maps/search/?api=1&query=Happy+Paws'
    },
    {
      'name': 'Animal Rescue Team',
      'image': 'assets/ngos/animal_rescue_team.jpg',
      'position': 'Volunteer',
      'location': 'Nearby 3 km away',
      'mapUrl':
          'https://www.google.com/maps/search/?api=1&query=Animal+Rescue+Team'
    },
    {
      'name': 'Pet Shelter',
      'image': 'assets/ngos/pet_shelter.jpg',
      'position': 'Volunteer',
      'location': 'Nearby 2 km away',
      'mapUrl': 'https://www.google.com/maps/search/?api=1&query=Pet+Shelter'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Opportunities'),
      ),
      body: ListView.builder(
        itemCount: ngos.length,
        itemBuilder: (context, index) {
          final ngo = ngos[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ngo['image']!,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ngo['name']!,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Position Required: ${ngo['position']}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Location: ${ngo['location']}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      InkWell(
                        onTap: () => _openMap(ngo['mapUrl']!),
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://maps.googleapis.com/maps/api/staticmap?center=${Uri.encodeComponent(ngo['name']!)}&zoom=14&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C${Uri.encodeComponent(ngo['name']!)}&key=YOUR_GOOGLE_MAPS_API_KEY',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _openMap(String mapUrl) async {
    // ignore: deprecated_member_use
    if (await canLaunch(mapUrl)) {
      // ignore: deprecated_member_use
      await launch(mapUrl);
    } else {
      throw 'Could not launch $mapUrl';
    }
  }
}
