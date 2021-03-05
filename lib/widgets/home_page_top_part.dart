import 'package:flutter/material.dart';

class HomePageTopPart extends StatelessWidget {
  final IconData icon;
  final String title;

  const HomePageTopPart({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
