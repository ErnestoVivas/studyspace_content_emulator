import 'package:flutter/material.dart';
import 'dart:io';
import 'package:studyspace_content_emulator/models/DisplayElement.dart';
import 'package:studyspace_content_emulator/amplify_s3_getter.dart';
import 'package:katex_flutter/katex_flutter.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class OverviewPageArgs {
  final List<DisplayElement> displayElements;
  final String imageFileDirectory;
  OverviewPageArgs(
    this.displayElements,
    this.imageFileDirectory
  );
}


class OverviewPage extends StatefulWidget {

  final OverviewPageArgs constructorArguments;
//  final List<DisplayElement> displayElements;
//  final String imageFileDirectory;

  OverviewPage({
    required this.constructorArguments
  });

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  List<DisplayElement> _singleListDisplayElements = [];
  List<List<DisplayElement>> _displayElements = [];
  Map<String, File?> _images = {};
  String _imageFileDirectory = '';
  Widget bodyWidget = Center(child: CircularProgressIndicator());
  int _currentPage = 0;
  bool _imagesLoaded = false;
  bool _elementsPrepared = false;


  @override
  void initState() {
    super.initState();
    _singleListDisplayElements = widget.constructorArguments.displayElements;
    _imageFileDirectory = widget.constructorArguments.imageFileDirectory;
    _splitElementsIntoPages();
    _loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Überblick'),
        centerTitle: true,
      ),

      body: _getBodyWidget()
    );
  }

  Widget _getBodyWidget() {
    Widget bodyWidget = Center(child: CircularProgressIndicator());
    if(_elementsPrepared && _imagesLoaded) {
      bodyWidget = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for(int i = 0; i < _displayElements[_currentPage].length; ++i)
                    Container(
                      padding: EdgeInsets.all(16),
                      child: _getDisplayElementWidget(_currentPage, i),
                    ),
                ]
              )
            ),
          ),
          if(_displayElements.length > 1)   // multiple pages
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(_currentPage == 0)
                  const ElevatedButton(
                    onPressed: null,
                    child: Icon(Icons.arrow_back_ios)
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      --_currentPage;
                      setState(() {});
                    },
                    child: Icon(Icons.arrow_back_ios)
                  ),
                Text(
                  '${_currentPage+1} / ${_displayElements.length}',
                  textAlign: TextAlign.center,
                ),
                if(_currentPage == (_displayElements.length - 1))
                  const ElevatedButton(
                      onPressed: null,
                      child: Icon(Icons.arrow_forward_ios)
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      ++_currentPage;
                      setState(() {});
                    },
                    child: Icon(Icons.arrow_forward_ios)
                  )
              ]
            )

        ]
      );
    }
    return bodyWidget;
  }

  void _splitElementsIntoPages() {
    int currentPage = 0;
    _displayElements.add([]);
    for(int i = 0; i < _singleListDisplayElements.length; ++i) {
      if(_singleListDisplayElements[i].page != currentPage) {
        _displayElements.add([]);
        currentPage = _singleListDisplayElements[i].page ?? 0;
      }
      _displayElements[currentPage].add(_singleListDisplayElements[i]);
    }
    setState(() => _elementsPrepared = true);
  }

  void _loadImages() async {
    for(int i = 0; i < _displayElements.length; ++i) {
      for(int j = 0; j < _displayElements[i].length; ++j) {
        if(_displayElements[i][j].type == 4) {
          String valueStr = _displayElements[i][j].value ?? '';
          File? newImage = await _loadOverviewImage(valueStr);
          _images[valueStr] = newImage;
        }
      }
    }
    setState(() => _imagesLoaded = true);
  }

  Future<File?> _loadOverviewImage(String imageFileKey) async {
    File? overviewImage = null;
    String imageFilename = imageFileKey.split('/').last;
    overviewImage = File('$_imageFileDirectory/$imageFilename');
    return overviewImage;
  }

  Widget _getDisplayElementWidget(int currentPage, int elementIndex) {
    Widget contentWidget;
    String valueStr = _displayElements[currentPage][elementIndex].value ?? '';
    debugPrint(valueStr);
    valueStr = valueStr.replaceAll(r'\n', '\n');
    if(valueStr[0] == '"') {
      valueStr = valueStr.substring(1);
    }
    if(valueStr[valueStr.length-1] == '"') {
      valueStr = valueStr.substring(0, valueStr.length-1);
    }
    if(_displayElements[currentPage][elementIndex].type == 0) {
      contentWidget = Text(
        valueStr,
        textAlign: TextAlign.justify,
        style: TextStyle(
          height: 1.5,
        ),
      );
    } else if(_displayElements[currentPage][elementIndex].type == 1) {
      contentWidget = MarkdownBody(
        data: valueStr,
        styleSheet: MarkdownStyleSheet(
          a: TextStyle(
            height: 1.5,
          ),
          p: TextStyle(
            height: 1.5,
          ),
          blockquote: TextStyle(
            height: 1.5,
          ),
          h1: TextStyle(
            height: 2.7,
          ),
          h2: TextStyle(
            height: 2.4,
          ),
          h3: TextStyle(
            height: 2.4,
          ),
          h4: TextStyle(
            height: 2.2,
          ),
          h5: TextStyle(
            height: 2.2,
          ),
          h6: TextStyle(
            height: 2.0,
          ),
          textAlign: WrapAlignment.spaceEvenly
        ),
      );
    } else if(_displayElements[currentPage][elementIndex].type == 2) {
      contentWidget = KaTeX(
        laTeXCode: Text(
          valueStr,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            height: 1.5
          ),
        )
      );
    } else if(_displayElements[currentPage][elementIndex].type == 3) {
      contentWidget = Center(
        child: Math.tex(
          valueStr,
          mathStyle: MathStyle.display,
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        )
      );
    } else {
      if(_images[valueStr] != null) {
        contentWidget = Image.file(
          _images[valueStr]!
        );
      }
      else {
        contentWidget = Text(
          'Image $valueStr could not be found',
          textAlign: TextAlign.center,
        );
      }
    }
    return contentWidget;
  }

}