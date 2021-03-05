import 'package:flutter/material.dart';
import 'package:parxlab_application/screens/login_screen.dart';

AppBar buildHomePageAppBar(
    BuildContext context, String title, IconData iconData) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
          icon: Icon(iconData),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(LoginScreen.id);
          }),
    ],
  );
}
