import 'package:anilove/pages/AppInfoPage.dart';
import 'package:anilove/pages/DarkModePage.dart';
import 'package:anilove/pages/LanguagePage.dart';
import 'package:anilove/providers/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anilove/providers/LanguageProvider.dart' as providers;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:anilove/pages/chooserolepage.dart';
import 'package:anilove/pages/createaccount.dart';
import 'package:anilove/pages/loginpage.dart';
import 'package:anilove/pages/signuppage.dart';
import 'package:anilove/pages/welcome.dart';
import 'package:anilove/pages/SettingsPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => providers.LanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, providers.LanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        return MaterialApp(
          theme: themeProvider.themeData,
          locale: languageProvider.locale,
          supportedLocales: [
            Locale('en', ''), // English
            Locale('es', ''), // Spanish
            Locale('fr', ''), // French
            Locale('de', ''), // German
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomePage(),
            '/chooseRole': (context) => ChooseRolePage(),
            '/login': (context) => LoginPage(),
            '/signup': (context) => SignUpPage(),
            '/createAccount': (context) => CreateAccountPage(),
            '/signIn': (context) => LoginPage(),
            '/settings': (context) => SettingsPage(),
            '/darkMode': (context) => DarkModePage(),
            '/language': (context) => LanguagePage(),
            '/appInfo': (context) => AppInfoPage(),
          },
        );
      },
    );
  }
}
