import 'package:flutter/material.dart';
import 'package:new_project/pages/first_page.dart';
import 'package:new_project/pages/home_page.dart';
import 'package:new_project/pages/profile_page.dart';
import 'package:new_project/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        "/firstpage": (context) => FirstPage(),
        "/homepage": (context) => HomePage(),
        "/settingspage": (context) => SettingsPage(),
        "/profilepage": (context) => ProfilePage(),
      },
    );
  }
}
