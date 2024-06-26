import 'package:anilove/providers/LanguageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatelessWidget {
  final List<String> languages = ['English', 'Spanish', 'French', 'German'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            onTap: () {
              Provider.of<LanguageProvider>(context, listen: false)
                  .setLanguage(languages[index]);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
