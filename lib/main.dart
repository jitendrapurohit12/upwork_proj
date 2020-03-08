import 'package:flutter/material.dart';
import 'package:upwork_proj/ui/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ScreenLogin.id,
      routes: {ScreenLogin.id: (_) => ScreenLogin()},
    );
  }
}
