import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Info'),
      ),
      body: Center(
        child: Text('App version 1.0.0'),
      ),
    );
  }
}
