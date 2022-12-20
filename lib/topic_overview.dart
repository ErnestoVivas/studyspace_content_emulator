// flutter/dart
import 'package:flutter/material.dart';

// HTML/TEX display
import 'package:flutter_tex/flutter_tex.dart';

// Backend data models
import 'package:studyspace_app_emulator/models/ModelProvider.dart';

// custom styles
import 'package:studyspace_app_emulator/custom_widgets/background_gradients.dart';
import 'package:studyspace_app_emulator/custom_widgets/studyspace_colors.dart';
import 'package:studyspace_app_emulator/custom_widgets/html_stylesheets.dart';


class TopicOverviewArguments {
  final List<DisplayElement> displayElementsList;   // Each displayElement is 1 page
  final int subject;
  final String subtopicName;
  TopicOverviewArguments(
    this.displayElementsList,
    this.subject,
    this.subtopicName
  );
}

class TopicOverview extends StatefulWidget {

  final TopicOverviewArguments constructorArguments;

  const TopicOverview({required this.constructorArguments});

  @override
  State<TopicOverview> createState() => _TopicOverviewState();
}

class _TopicOverviewState extends State<TopicOverview> {

  // overview content (to be loaded by initState)
  List<TeXViewDocument> _overviewPages = [];

  // body widget status
  Widget _bodyWidget = Center(child: CircularProgressIndicator(color: Colors.grey));
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _prepOverviewData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: StudyspaceBackgroundGradients.getSubjectGradient(widget.constructorArguments.subject),
      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,

        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.17,
          leadingWidth: 70,
          leading: Container(
            padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              splashRadius: 42,
              iconSize: 64,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/studyspace_arrow_back.png')
            )
          ),
          title: Text(
            widget.constructorArguments.subtopicName,
            style: TextStyle(
              color: StudyspaceColors.getSubjectFontColor(widget.constructorArguments.subject),
              fontWeight: FontWeight.w600,
              fontSize: 20
            )
          ),
          centerTitle: true,
        ),

        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          ),
          height: double.maxFinite,
          child: _bodyWidget
        )
      )
    );
  }

  void _prepOverviewData() async {
    String styleSheet = StudyspaceStylesheets.subjectStylesheet[widget.constructorArguments.subject] ?? '';
    String headSection = '<head><style>$styleSheet</style></head>';
    for(int i = 0; i < widget.constructorArguments.displayElementsList.length; ++i) {
      String currentPageBodyHTML = widget.constructorArguments.displayElementsList[i].value ?? '';
      String currentPageHTML = '$headSection$currentPageBodyHTML';
      TeXViewDocument newTeXViewDocument = TeXViewDocument(currentPageHTML);
      _overviewPages.add(newTeXViewDocument);
    }
    _updateBodyWidget();
  }

  void _updateBodyWidget() {
    _bodyWidget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // display HTML/Latex page
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color.fromRGBO(255, 255, 255, 0.0), Color.fromRGBO(255, 255, 255, 0.0), Colors.white],
                  stops: [0.002, 0.05, 0.95, 0.998], // 10% purple, 80% transparent, 10% purple
                ).createShader(rect);
              },
              blendMode: BlendMode.overlay,
              child: TeXView(
                renderingEngine: const TeXViewRenderingEngine.katex(),
                fonts: const [
                  TeXViewFont(fontFamily: 'Quicksand', src: 'fonts/Quicksand-Regular.ttf'),
                  TeXViewFont(fontFamily: 'Quicksand-Medium', src: 'fonts/Quicksand-Medium.ttf'),
                  TeXViewFont(fontFamily: 'Quicksand-SemiBold', src: 'fonts/Quicksand-SemiBold.ttf'),
                  TeXViewFont(fontFamily: 'Quicksand-Bold', src: 'fonts/Quicksand-Bold.ttf'),
                ],
                style: const TeXViewStyle(
                  padding: TeXViewPadding.all(16),
                ),
                loadingWidgetBuilder: (context) => Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary),
                      const Text("Lade Inhalt ...")
                    ],
                  ),
                ),
                child: _overviewPages[_currentPage],
              )
            )
          )
        ),

        // If there are multiple pages, add buttons at the bottom to navigate pages
        if(_overviewPages.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(_currentPage == 0)
                IconButton(
                  padding: const EdgeInsets.all(0),
                  splashRadius: 42,
                  iconSize: 64,
                  onPressed: null,
                  icon: Image.asset('assets/studyspace_arrow_back.png')
                )
              else
                IconButton(
                  padding: const EdgeInsets.all(0),
                  splashRadius: 42,
                  iconSize: 64,
                  onPressed: () {
                    --_currentPage;
                    _updateBodyWidget();
                    setState(() {});
                  },
                  icon: Image.asset('assets/studyspace_arrow_back.png')
                ),
              Text(
                '${_currentPage+1} / ${_overviewPages.length}',
                textAlign: TextAlign.center,
              ),
              if(_currentPage == (_overviewPages.length - 1))
                IconButton(
                  padding: const EdgeInsets.all(0),
                  splashRadius: 42,
                  iconSize: 64,
                  onPressed: null,
                  icon: Image.asset('assets/studyspace_arrow_forward.png')
                )
              else
                IconButton(
                  padding: const EdgeInsets.all(0),
                  splashRadius: 42,
                  iconSize: 64,
                  onPressed: () {
                    ++_currentPage;
                    _updateBodyWidget();
                    setState(() {});
                  },
                  icon: Image.asset('assets/studyspace_arrow_forward.png')
                ),
            ]
          )
      ]
    );
  }

}