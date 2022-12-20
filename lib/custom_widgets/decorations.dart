/*
 * input decorations (text fields), box decorations, shadows, etc.
 */

import 'package:flutter/material.dart';


class Decorations {

  static InputDecoration standardBlueFocusInputDecoration(String hintText) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: Colors.grey)
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: Colors.grey)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: Color.fromRGBO(92, 146, 251, 1.0))
      ),
      hintText: hintText,
    );
  }

  static BoxDecoration standardDropdownButtonDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: -6,
        blurRadius: 8,
        offset: const Offset(0, 0), // changes position of shadow
      ),
    ]
  );
}