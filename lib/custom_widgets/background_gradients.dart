/*
 * Gradients used as page backgrounds
 */


import 'package:flutter/material.dart';

class StudyspaceBackgroundGradients {
  static LinearGradient standardGradient = const LinearGradient(
    begin: Alignment(-1.0, -0.15),
    end: Alignment(1.0, 0.15),
    stops: [0.0, 0.42, 0.95, 1.0],
    colors: <Color>[
      Color.fromRGBO(178, 242, 187, 1.0),
      Color.fromRGBO(153, 233, 242, 1.0),
      Color.fromRGBO(165, 216, 255, 1.0),
      Color.fromRGBO(165, 216, 255, 1.0)
    ]
  );

  static LinearGradient rainbowGradient = const LinearGradient(
    begin: Alignment(-1.0, -0.15),
    stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
    end: Alignment(1.0, 0.15),
    colors: <Color>[
      Color.fromRGBO(255, 236, 153, 1.0),
      Color.fromRGBO(255, 216, 168, 1.0),
      Color.fromRGBO(178, 242, 187, 1.0),
      Color.fromRGBO(165, 216, 255, 1.0),
      Color.fromRGBO(153, 233, 242, 1.0),
      Color.fromRGBO(208, 191, 255, 1.0),
    ]
  );


  // Linear subject gradients

  static LinearGradient mathGradient = const LinearGradient(
    begin: Alignment(-1.0, -1.0),
    stops: [0.0, 0.45, 1.0],
    end: Alignment(1.0, -0.2),
    colors: <Color>[
      Color.fromRGBO(255, 255, 255, 1.0),
      Color.fromRGBO(208, 235, 255, 1.0),
      Color.fromRGBO(165, 216, 255, 1.0),
    ]
  );

  static LinearGradient germanGradient = const LinearGradient(
    begin: Alignment(-1.0, -1.0),
    stops: [0.0, 0.5, 1.0],
    end: Alignment(1.0, -0.2),
    colors: <Color>[
      Color.fromRGBO(248, 249, 250, 1.0),
      Color.fromRGBO(255, 205, 225, 1.0),
      Color.fromRGBO(255, 168, 168, 1.0),
    ]
  );

  static LinearGradient mathOverviewBottomGradient = const LinearGradient(
    begin: Alignment(0.0, -1.0),
    stops: [0.1, 0.9, 1.0],
    end: Alignment(0.0, 1.0),
    colors: <Color>[
      Color.fromRGBO(255, 255, 255, 1.0),
      Color.fromRGBO(208, 235, 255, 1.0),
      Color.fromRGBO(165, 216, 255, 1.0),
    ]
  );

  static LinearGradient germanOverviewBottomGradient = const LinearGradient(
    begin: Alignment(0.0, -1.0),
    stops: [0.1, 0.9, 1.0],
    end: Alignment(0.0, 1.0),
    colors: <Color>[
      Color.fromRGBO(248, 249, 250, 1.0),
      Color.fromRGBO(255, 205, 225, 1.0),
      Color.fromRGBO(255, 168, 168, 1.0),
    ]
  );

  // Radial subject gradients

  static RadialGradient mathGradientRadial = const RadialGradient(
    colors: <Color> [Color.fromRGBO(208, 235, 255, 1.0), Color.fromRGBO(165, 216, 255, 1.0)]
  );

  static RadialGradient germanGradientRadial = const RadialGradient(
    colors: <Color> [Color.fromRGBO(255, 222, 235, 1.0), Color.fromRGBO(252, 194, 215, 1.0)],
  );


  // getter

  static RadialGradient getSubjectRadialGradient(int subject) {
    RadialGradient subjectRadialGradient = const RadialGradient(colors: [Colors.white, Colors.grey]);
    if(subject == 0) {
      subjectRadialGradient = mathGradientRadial;
    } else if(subject == 1) {
      subjectRadialGradient = germanGradientRadial;
    }
    return subjectRadialGradient;
  }

  static LinearGradient getSubjectGradient(int subject) {
    LinearGradient subjectGradient = const LinearGradient(colors: [Colors.white, Colors.grey]);
    if(subject == 0) {
      subjectGradient = mathGradient;
    } else if(subject == 1) {
      subjectGradient = germanGradient;
    }
    return subjectGradient;
  }

  static LinearGradient getOverviewBottomGradient(int subject) {
    LinearGradient subjectGradient = const LinearGradient(colors: [Colors.white, Colors.grey]);
    if(subject == 0) {
      subjectGradient = mathOverviewBottomGradient;
    } else if(subject == 1) {
      subjectGradient = germanOverviewBottomGradient;
    }
    return subjectGradient;
  }

}