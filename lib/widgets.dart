import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 30.0,
    ),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    ),
  );
}
