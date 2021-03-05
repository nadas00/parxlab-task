import 'package:flutter/material.dart';

import '../constants.dart';

class PersistentTableHeader extends StatelessWidget {
  final String header1;
  final String header2;
  final String header3;

  const PersistentTableHeader({
    Key key,
    @required this.header1,
    @required this.header2,
    @required this.header3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.5))),
      ),
      height: 61,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              header1,
              style: kPersistentHeaderTextStyle,
            ),
          )),
          Expanded(
              child: Text(
            header2,
            style: kPersistentHeaderTextStyle,
          )),
          Expanded(
              child: Text(
            header3,
            style: kPersistentHeaderTextStyle,
          )),
        ],
      ),
    );
  }
}
