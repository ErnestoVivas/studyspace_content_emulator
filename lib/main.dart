import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studyspace_app_emulator/custom_widgets/button_styles.dart';
import 'package:studyspace_app_emulator/custom_widgets/studyspace_colors.dart';
import 'package:studyspace_app_emulator/models/ModelProvider.dart';
//import 'package:studyspace_app_emulator/overview.dart';
import 'package:studyspace_app_emulator/topic_overview.dart';
import 'package:studyspace_app_emulator/singleChoiceQuestion.dart';
import 'package:studyspace_app_emulator/single_choice_question_set.dart';
import 'package:file_picker/file_picker.dart';
import 'package:studyspace_app_emulator/models/DisplayElement.dart';
import 'package:desktop_window/desktop_window.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/topicOverview': (context) => TopicOverview(constructorArguments: ModalRoute.of(context)!.settings.arguments as TopicOverviewArguments),
      //'/singleChoiceQuestionSet': (context) => SingleChoicePage(questions: ModalRoute.of(context)!.settings.arguments as List<SingleChoiceQuestion>)
      '/singleChoiceQuestionSet': (context) => MultipleChoicePage(constructorArguments: ModalRoute.of(context)!.settings.arguments as MultipleChoicePageArguments)
    },
    title: 'Studyspace App Emulator',
    theme: ThemeData(
      fontFamily: 'Quicksand',
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color.fromRGBO(92, 146, 251, 1.0),
        selectionColor: Color.fromRGBO(92, 146, 251, 1.0),
        selectionHandleColor: Color.fromRGBO(92, 146, 251, 1.0)
      ),

      // default app bar
      appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.transparent,
      )
    )
  ));

}


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  initState() {
    super.initState();
    _setWindowSize();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(92, 146, 251, 1.0),
        title: const Text('Studyspace App Emulator'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 200,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    _openOverviewPage(context);
                  },
                  style: ButtonStyles.standardBlueButtonStyle,
                  child: const Text(
                    'Überblick'
                  )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 200,
                height: 80,
                child: ElevatedButton(
                  onPressed: _openSingleChoiceSet,
                  style: ButtonStyles.standardBlueButtonStyle,
                  child: const Text(
                    'Single choice set'
                  )
                ),
              ),
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openOverviewPage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null) {
      File overviewFile = File(result.files.single.path!);
      String filename = result.files.single.name;
      debugPrint(filename);
      String overviewContent = await overviewFile.readAsString();
      List<String> overviewPages = overviewContent.split('NEWPAGE');
      List<DisplayElement> overviewDisplayElements = [];
      for(int i = 0; i < overviewPages.length; ++i) {
        if(overviewPages[i].length > 10) {
          DisplayElement newDisplayElement = DisplayElement(
            key: '0/0/7/overview',
            page: i,
            index: i,
            type: 0,
            value: overviewPages[i]
          );
          overviewDisplayElements.add(newDisplayElement);
        }
      }

      // parse file content
      /*
      List<List<dynamic>> displayElementsCSV = [];
      List<DisplayElement> newDisplayElements = [];
      List<String> rows = overviewContent.split('CRLF');       // assumes CRLF as eol delimiter
      int i = 0;
      int subject = 0;
      for(String row in rows) {
        debugPrint('Row ${++i}');
        List<dynamic> rowElements = row.split(',');
        print('Row length: ${rowElements.length}');

        // glue falsely splitted value string back together
        if(rowElements.length > 8) {
          for(int i = 6; i < (rowElements.length - 2); ++i) {
            rowElements[5] = rowElements[5] + ',' + rowElements[i];
          }
        }

        if(rowElements.length > 1) {
          displayElementsCSV.add(rowElements);
        }
        //print(rowElements.length);
      }

      for(int i = 1; i < displayElementsCSV.length; ++i) {
        if(displayElementsCSV[i].length > 5) {
          subject = int.parse(displayElementsCSV[i][1][0]);
          DisplayElement newDisplayElement = DisplayElement(
            key: displayElementsCSV[i][1] as String,
            page: int.parse(displayElementsCSV[i][2]),
            index: int.parse(displayElementsCSV[i][3]),
            type: int.parse(displayElementsCSV[i][4]),
            value: displayElementsCSV[i][5] as String
          );
          newDisplayElements.add(newDisplayElement);
        }
      }*/
      //OverviewPageArgs args = OverviewPageArgs(newDisplayElements, imageFileDirectory);
      //Navigator.pushNamed(context, '/overview', arguments: args);

      TopicOverviewArguments overviewConstructorArgs = TopicOverviewArguments(
        overviewDisplayElements,
        0,
        '>Titel Unterthema<',
      );
      Navigator.pushNamed(context, '/topicOverview', arguments: overviewConstructorArgs);
    }
  }

  void _openSingleChoiceSet() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File singleChoiceSetFile = File(result.files.single.path!);
      String filename = result.files.single.name;
      int subject = int.parse(filename[0]);
      String singleChoiceSet = await singleChoiceSetFile.readAsString();

      // parse file content
      List<SingleChoiceQuestion> questions = [];
      List<String> rows = singleChoiceSet.split('CRLF');
      int i = 0;
      for (String row in rows) {
        if(i > 0) {
          List<dynamic> rowElements = row.split('\t');
          if (rowElements.length >= 14) {

            SingleChoiceQuestion newSCQuestion = SingleChoiceQuestion(
              key: rowElements[1],
              title: rowElements[2] ?? '',
              image: rowElements[3] ?? '',
              equation: rowElements[4] ?? '',
              description: rowElements[5] ?? '',
              question: rowElements[6] ?? '',
              numberOfAnswers: int.parse(rowElements[7]),
              correctAnswer: int.parse(rowElements[8]),
              answer0: rowElements[9] ?? '',
              answer1: rowElements[10] ?? '',
              answer2: rowElements[11] ?? '',
              answer3: rowElements[12] ?? '',
              answer4: rowElements[13] ?? '',
              hint: rowElements[14] ?? '',
            );
            questions.add(newSCQuestion);
          }
        }
        ++i;
      }
      MultipleChoicePageArguments constructorArgs = MultipleChoicePageArguments(
        questions,
        0,
        StudyspaceColors.math,
        StudyspaceColors.mathFont
      );
      Navigator.pushNamed(context, '/singleChoiceQuestionSet', arguments: constructorArgs);
    }
  }

  void _setWindowSize() async {
    await DesktopWindow.setWindowSize(const Size(412, 732));
    await DesktopWindow.setMinWindowSize(const Size(320, 568));
    await DesktopWindow.setMaxWindowSize(const Size(480, 896));
    setState(() {});
  }
}
