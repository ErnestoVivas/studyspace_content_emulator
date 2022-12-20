/*
 * Default colors e.g. for subjects by studyspace
 */

import 'package:flutter/material.dart';

class StudyspaceColors {

  // math
  static Color math = Color.fromRGBO(165, 216, 255, 1.0);
  static Color mathFont = Color.fromRGBO(24, 100, 171, 1.0);
  static Color mathRadialGradientStart = Color.fromRGBO(208, 235, 255, 1.0);

  // german
  static Color german = Color.fromRGBO(252, 194, 215, 1.0);
  static Color germanFont = Color.fromRGBO(166, 30, 77, 1.0);
  static Color germanRadialGradientStart = Color.fromRGBO(255, 222, 235, 1.0);


  // getter (should be maps, :rolleyes: )

  static Color getSubjectColor(int subject) {
    Color subjectColor = Colors.white;
    if(subject == 0) {
      subjectColor = math;
    } else if(subject == 1) {
      subjectColor = german;
    }
    return subjectColor;
  }

  static Color getSubjectFontColor(int subject) {
    Color subjectFontColor = Colors.black;
    if(subject == 0) {
      subjectFontColor = mathFont;
    } else if(subject == 1) {
      subjectFontColor = germanFont;
    }
    return subjectFontColor;
  }

  static String getSubjectFontColorRGBString(int subject) {
    String subjectFontColor = r'rgb(0,0,0)';
    if(subject == 0) {
      subjectFontColor = r'rgb(24,100,171)';
    } else if(subject == 1) {
      subjectFontColor = r'rgb(166,30,77)';
    }
    return subjectFontColor;
  }

  static Color getSubjectRadialGradientStartColor(int subject) {
    Color subjectRadialGradientStartColor = Colors.white;
    if(subject == 0) {
      subjectRadialGradientStartColor = mathRadialGradientStart;
    } else if(subject == 1) {
      subjectRadialGradientStartColor = germanRadialGradientStart;
    }
    return subjectRadialGradientStartColor;
  }

}