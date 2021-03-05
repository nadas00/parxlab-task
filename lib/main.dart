import 'package:flutter/material.dart';
import 'package:parxlab_application/screens/home_screen.dart';
import 'package:parxlab_application/screens/login_screen.dart';

Future<void> main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: LoginScreen.id,
    routes: {
      LoginScreen.id: (context) => LoginScreen(),
      HomeScreen.id: (context) => HomeScreen(),
    },
  ));
}
