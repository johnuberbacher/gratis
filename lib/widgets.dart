import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
    ),
    child: Padding(
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
    ),
  );
}
