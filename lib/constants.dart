import 'package:flutter/material.dart';

const BoxDecoration kRecordsTableDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      blurRadius: 5,
      spreadRadius: 1,
      offset: Offset(0.0, 4.0),
      color: Colors.black26,
    ),
  ],
  color: Colors.white,
);

const BoxDecoration kLoginFormDecoration =
    BoxDecoration(color: Colors.white, boxShadow: [
  BoxShadow(
    blurRadius: 5,
    spreadRadius: 1,
    offset: Offset(0.0, 0.0),
    color: Colors.black12,
  ),
]);

const TextStyle kLoginFormLabelTextStyle = TextStyle(color: Colors.grey);

const TextStyle kPersistentHeaderTextStyle =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);
