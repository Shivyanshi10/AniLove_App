import 'package:anilove/pages/main.dart';
import 'package:anilove/providers/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkModePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Mode'),
      ),
      body: SwitchListTile(
        title: Text('Enable Dark Mode'),
        value: Provider.of<ThemeProvider>(context).isDarkMode,
        onChanged: (bool value) {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
        },
      ),
    );
  }
}
