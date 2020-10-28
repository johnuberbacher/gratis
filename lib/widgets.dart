import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
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

InputDecoration elevatedTextFieldInputDecoration(context, String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.transparent, width: 3.0),
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 25,
    ),
  );
}

InputDecoration elevatedPasswordInputDecoration(context, String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.transparent, width: 3.0),
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 25,
    ),
    suffixIcon: Icon(Icons.remove_red_eye),
  );
}
