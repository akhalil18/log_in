import 'package:flutter/material.dart';
import './screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.amber,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Log in'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}
