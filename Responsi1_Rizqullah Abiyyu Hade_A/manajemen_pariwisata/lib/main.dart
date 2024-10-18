import 'package:flutter/material.dart';
import 'package:manajemen_pariwisata/pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manajemen Pariwisata',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        colorScheme: ColorScheme.light(primary: Colors.red),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Arial'),
          bodyMedium: TextStyle(fontFamily: 'Arial'),
        ),
      ),
      home: LoginPage(),
    );
  }
}
