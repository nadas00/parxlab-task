import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.code,
                  color: Colors.white,
                  size: 100.0,
                ),
                Text(
                  "Hasan Çiftçi",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
