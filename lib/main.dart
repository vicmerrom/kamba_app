
import 'package:flutter/material.dart';
import 'src/login.dart';


void main() => runApp(MaterialApp( home: LoginPage()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Text(''),
    );
  }
}