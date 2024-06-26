import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLanguage(String language) {
    switch (language) {
      case 'Spanish':
        _locale = Locale('es');
        break;
      case 'French':
        _locale = Locale('fr');
        break;
      case 'German':
        _locale = Locale('de');
        break;
      default:
        _locale = Locale('en');
    }
    notifyListeners();
  }
}
