import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studyspace_content_emulator/models/ModelProvider.dart';
import 'package:studyspace_content_emulator/overview.dart';
import 'package:studyspace_content_emulator/singleChoiceQuestion.dart';
import 'package:file_picker/file_picker.dart';
import 'package:studyspace_content_emulator/models/DisplayElement.dart';
import 'package:desktop_window/desktop_window.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/overview': (context) => OverviewPage(constructorArguments: ModalRoute.of(context)!.settings.arguments as OverviewPageArgs),
      '/singleChoiceQuestionSet': (context) => SingleChoicePage(questions: ModalRoute.of(context)!.settings.arguments as List<SingleChoiceQuestion>)
    },
    title: 'Studyspace App Emulator',
  ));

}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studyspace App Emulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Studyspace App Emulator'),
    );
  }
}
*/

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
        title: Text('Studyspace App Emulator'),
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
    if (result != null) {
      File overviewFile = File(result.files.single.path!);
      String imageFileDirectory = '${overviewFile.parent.path}/images';
      String overviewContent = await overviewFile.readAsString();

      // parse file content
      List<List<dynamic>> displayElementsCSV = [];
      List<DisplayElement> newDisplayElements = [];
      List<String> rows = overviewContent.split('CRLF');       // assumes \n as eol delimiter
      int i = 0;
      for(String row in rows) {
        print('Row ${++i}');
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
        print(rowElements.length);
      }

      for(int i = 1; i < displayElementsCSV.length; ++i) {
        if(displayElementsCSV[i].length > 5) {
          DisplayElement newDisplayElement = DisplayElement(
            key: displayElementsCSV[i][1] as String,
            page: int.parse(displayElementsCSV[i][2]),
            index: int.parse(displayElementsCSV[i][3]),
            type: int.parse(displayElementsCSV[i][4]),
            value: displayElementsCSV[i][5] as String
          );
          newDisplayElements.add(newDisplayElement);
        }
      }
      OverviewPageArgs args = OverviewPageArgs(newDisplayElements, imageFileDirectory);
      Navigator.pushNamed(context, '/overview', arguments: args);
    }
  }

  void _openSingleChoiceSet() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File singleChoiceSetFile = File(result.files.single.path!);
      //String imageFileDirectory = singleChoiceSetFile.parent.path + '/images'; // TODO implement when necessary
      String singleChoiceSet = await singleChoiceSetFile.readAsString();

      // parse file content
      List<SingleChoiceQuestion> questions = [];
      List<String> rows = singleChoiceSet.split('CRLF');
      int i = 0;
      for (String row in rows) {
        if(i > 0) {
          List<dynamic> rowElements = row.split(',');
          if (rowElements.length > 12) {

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
            );
            questions.add(newSCQuestion);
          }
        }
        ++i;
      }
      Navigator.pushNamed(context, '/singleChoiceQuestionSet', arguments: questions);
    }
  }

  void _setWindowSize() async {
    await DesktopWindow.setWindowSize(const Size(412, 732));
    await DesktopWindow.setMinWindowSize(const Size(320, 568));
    await DesktopWindow.setMaxWindowSize(const Size(480, 896));
    setState(() {});
  }
}
