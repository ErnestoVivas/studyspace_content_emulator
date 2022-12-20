/*
 * Default button styles
 */

import 'package:flutter/material.dart';

class ButtonStyles {

  static ButtonStyle standardBlueButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(0.0),
    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(92, 146, 251, 1.0)),
    minimumSize: MaterialStateProperty.all(const Size(0.0, 50.0)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      )
    )
  );

  static ButtonStyle standardHighlightBlueButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(0.0),
    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(77, 171, 247, 1.0)),
    minimumSize: MaterialStateProperty.all(const Size(0.0, 50.0)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      )
    )
  );

  static ButtonStyle standardGreyOutlinedButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(0.0),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    minimumSize: MaterialStateProperty.all(const Size(0.0, 50.0)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      )
    ),
    side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.grey)),
    overlayColor: MaterialStateProperty.resolveWith(
      (states) {
        return states.contains(MaterialState.pressed)
          ? Color.fromRGBO(235, 241, 245, 1.0)
          : null;
      },
    ),
  );
}