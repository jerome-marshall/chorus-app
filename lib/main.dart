import 'package:chorus_app/view/home_screen.dart';
import 'package:chorus_app/view/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chorus-App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoadingScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoadingScreen.routeName: (context) => LoadingScreen()
      },
    );
  }
}
