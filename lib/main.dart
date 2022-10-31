import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studyspace_content_emulator/overview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:studyspace_content_emulator/models/DisplayElement.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/overview': (context) => OverviewPage(constructorArguments: ModalRoute.of(context)!.settings.arguments as OverviewPageArgs)
    },
    title: 'Studyspace App Emulator',
  ));

  //runApp(const MyApp());
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
                child: ElevatedButton(
                  onPressed: () {
                    _openOverviewPage(context);
                  },
                  child: Text(
                    'Überblick'
                  )
                ),
                width: 200,
                height: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: _openSingleChoiceSet,
                  child: Text(
                    'Single choice set'
                  )
                ),
                width: 200,
                height: 100,
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
      String imageFileDirectory = overviewFile.parent.path + '/images';
      String overviewContent = await overviewFile.readAsString();

      // parse file content
      List<List<dynamic>> displayElementsCSV = [];
      List<DisplayElement> newDisplayElements = [];
      List<String> rows = overviewContent.split('CRLF');       // assumes \n as eol delimiter
      int i = 0;
      for(String row in rows) {
        print('Row ${++i}');
        List<dynamic> rowElements = row.split('\t');
        if(rowElements.length > 1) {
          displayElementsCSV.add(rowElements);
        }
        print(rowElements.length);
      }

      for(int i = 1; i < displayElementsCSV.length; ++i) {
        if(displayElementsCSV[i].length > 5) {
          DisplayElement newDisplayElement = DisplayElement(
            id: displayElementsCSV[i][0] as String,
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

  void _openSingleChoiceSet() {
    //
  }
}
