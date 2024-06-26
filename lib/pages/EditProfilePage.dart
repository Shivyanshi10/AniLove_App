import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = '';
  String _gender = '';
  String _phoneNumber = '';
  String _email = '';
  String _username = '';
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });

      // TODO: Upload the image to the database
      // Example:
      // await DatabaseService.uploadProfileImage(_profileImage);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile photo updated successfully!')),
      );
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // TODO: Push the updates to the database
      // Example:
      // DatabaseService.updateUserProfile(
      //   fullName: _fullName,
      //   gender: _gender,
      //   phoneNumber: _phoneNumber,
      //   email: _email,
      //   username: _username,
      // );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : AssetImage('assets/profile_photo.jpg')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: _showImagePickerOptions,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Username',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'user@example.com',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Divider(height: 40),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fullName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gender = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
