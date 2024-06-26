import 'package:anilove/pages/EditProfilePage.dart';
import 'package:anilove/pages/ProfilePage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:anilove/pages/AllCasesPage.dart';
import 'package:anilove/pages/SaveLifePage.dart';
import 'package:anilove/pages/DonatePage.dart';

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
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/signIn': (context) => LoginPage(),
        '/Homepage': (context) => HomePage(),
        '/profilepage': (context) => ProfilePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _totalDonationAmount = 2000;
  int _totalAnimalsRescued = 200;
  int _animalsInProcess = 10;
  int _totalAnimalsAdopted = 50;

  final List<String> _videoPaths = [
    'assets/v1.mp4',
    'assets/v2.mp4',
    'assets/v3.mp4',
    'assets/v4.mp4',
    'assets/v5.mp4',
    'assets/v6.mp4'
  ];

  late List<VideoPlayerController> _controllers;

  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _controllers = _videoPaths.map((path) {
      VideoPlayerController controller = VideoPlayerController.asset(path);
      controller.initialize().then((_) {
        setState(() {});
      });
      return controller;
    }).toList();

    Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        _totalAnimalsRescued += 1;
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return DonatePage();
      case 1:
        return _buildHomeContent();
      case 2:
        return ProfilePage();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Calibri',
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'One step forward for saving a life!',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Calibri',
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Take a next step by clicking on Save Life!',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Calibri',
            ),
          ),
          SizedBox(height: 20.0),
          Card(
            color: const Color.fromARGB(255, 15, 1, 18),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/voice.jpeg',
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Be a Voice for Voiceless!',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SaveLifePage()),
                            );
                          },
                          child: Text('Save Life!'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Love from Streets',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Card(
            //color: Color.fromARGB(255, 255, 255, 255),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Color.fromARGB(255, 32, 32, 127),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                      items: _controllers.map((controller) {
                        return Builder(
                          builder: (BuildContext context) {
                            return controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: controller.value.aspectRatio,
                                    child: Stack(
                                      children: [
                                        VideoPlayer(controller),
                                        Positioned.fill(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                controller.value.isPlaying
                                                    ? controller.pause()
                                                    : controller.play();
                                              });
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Previous Updates',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllCasesPage()),
                  );
                },
                child: Text('See All'),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildCard('assets/u1.jpg', 'Dog', 'Dasarahalli', 'Processing'),
                buildCard(
                    'assets/u2.jpeg', 'Cow', 'Soldevanahalli', 'Completed'),
                buildCard(
                    'assets/u3.jpeg', 'Bull', 'Hesargatha Road', 'Processing'),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Card(
            color: Color.fromARGB(255, 63, 81, 171),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Want to Donate Some Amount?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Donation Amount',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(
                              255, 255, 255, 255), // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonatePage()),
                          );
                        },
                        child: Text('Donate Now!'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '\$$_totalDonationAmount',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Our Statistics',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Card(
            color: Color.fromARGB(255, 63, 81, 171),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildStatisticRow(
                      'Total Animals Rescued', _totalAnimalsRescued),
                  buildStatisticRow('Animals in Process', _animalsInProcess),
                  buildStatisticRow(
                      'Total Animals Adopted', _totalAnimalsAdopted),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              "Join us to make a difference in the lives of Street Animals!",
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibri',
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              "With ❤️ from the Anilove Team",
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibri',
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(
      String imagePath, String title, String location, String status) {
    Color statusColor;
    if (status == 'Processing') {
      statusColor = Colors.orange;
    } else if (status == 'Completed') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.grey;
    }

    return Container(
      width: 160.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imagePath,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(location),
                  SizedBox(height: 4.0),
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatisticRow(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/logooo.png', width: 40, height: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('AniLove'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                showNotificationMenu(context);
              },
            ),
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Shivyanshi Rai'),
                accountEmail: Text('shivyanshirai10@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              ListTile(
                title: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Edit Profile'),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('My Contribution'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle My Contribution option
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle Change Password option
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help and Support'),
                trailing: Icon(Icons.arrow_forward_ios),
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
        body: _buildPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism),
              label: 'Donate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 47, 26, 186),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  void showNotificationMenu(BuildContext context) {
    final List<String> notifications = [
      'New case notification received',
      '200 rupees received from UPI ID 123******',
      'Your recent donation was successful!',
      'Thank you for your contribution!'
    ];

    final List<PopupMenuItem<int>> items = notifications.map((String message) {
      return PopupMenuItem<int>(
        value: notifications.indexOf(message),
        child: Text(message),
      );
    }).toList();

    showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width,
        kToolbarHeight,
        0.0,
        0.0,
      ),
      items: items,
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        // Handle selection
      }
    });
  }
}
