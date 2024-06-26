// ignore_for_file: unused_import

import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:anilove/pages/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
// ignore: library_prefixes
import 'package:anilove/pages/SaveLifePage.dart' as saveLife;
import 'package:geolocator/geolocator.dart';
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
        '/Homepage': (context) => HomePage(),
        '/SaveLifePage': (context) => saveLife.SaveLifePage(),
      },
    );
  }
}

class SaveLifePage extends StatefulWidget {
  @override
  _SaveLifePageState createState() => _SaveLifePageState();
}

class _SaveLifePageState extends State<SaveLifePage> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String selectedPhotoName = '';
  Position? currentPosition;

  Future<void> _selectPhoto(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Select from Gallery'),
              onTap: () async {
                Navigator.pop(context);
                await _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a Photo'),
              onTap: () async {
                Navigator.pop(context);
                await _pickImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        selectedPhotoName = pickedFile.name;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle if permission is denied
    } else if (permission == LocationPermission.deniedForever) {
      // Handle if permission is permanently denied
    } else {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        currentPosition = position;
        addressController.text =
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
    }
  }

  void _submit() {
    Fluttertoast.showToast(
      msg: "Submitted Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    Navigator.pushNamed(context, '/Homepage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Life!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20.0),
            if (selectedPhotoName.isNotEmpty)
              Text('Selected Photo: $selectedPhotoName'),
            ElevatedButton(
              onPressed: () => _selectPhoto(context),
              child: Text('Select Photo'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _getCurrentLocation(),
              child: Text('Get Live Location'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
