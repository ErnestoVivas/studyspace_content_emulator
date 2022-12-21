import 'package:flutter/material.dart';

import 'package:studyspace_app_emulator/models/ModelProvider.dart';
import 'package:studyspace_app_emulator/custom_widgets/background_gradients.dart';

import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MultipleChoicePageArguments {
  final List<SingleChoiceQuestion> questions;
  final int subject;
  final Color subjectColor;
  final Color subjectFontColor;

  MultipleChoicePageArguments(
    this.questions,
    this.subject,
    this.subjectColor,
    this.subjectFontColor
  );
}


// Up to 5 answers are supported (dummy for initial state when no answer has been selected)
enum Answers {option1, option2, option3, option4, option5, dummy}


class MultipleChoicePage extends StatefulWidget {

  // questions hold by the page
  //final List<SingleChoiceQuestion> questions;
  final MultipleChoicePageArguments constructorArguments;

  // constructor
  const MultipleChoicePage({required this.constructorArguments});

  // page state
  State<MultipleChoicePage> createState() => _MultipleChoicePageState();
}


class _MultipleChoicePageState extends State<MultipleChoicePage> {

  // changeable body widget
  Widget _bodyWidget = Center(child: CircularProgressIndicator());
  int _currentQuestion = 0;
  int _correctAnswersCount = 0;
  String _currentTitle = '';

  // parameters to track current question state
  Answers? _currentOption = Answers.dummy;
  bool _answerSelected = false;
  bool _answerCorrect = false;
  String _feedback = 'Richtig!';
  Color _feedbackColor = Colors.green;



  // initialize the page
  @override
  initState() {
    super.initState();
    _loadCurrentQuestion();
    setState(() {});
  }

  // build method
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 362,
        height: 642,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black
          ),
          gradient: StudyspaceBackgroundGradients.getSubjectGradient(widget.constructorArguments.subject),
        ),
        child: Scaffold(

          backgroundColor: Colors.transparent,

          // top app bar
          appBar: AppBar(
            toolbarHeight: 642 * 0.17,
            leadingWidth: 70,
            leading: Container(
              padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                splashRadius: 42,
                iconSize: 64,
                onPressed: () {
                  Navigator.pop(context, -1);
                },
                icon: Image.asset('assets/studyspace_arrow_back.png')
              )
            ),
            title: Text(
              _currentTitle,
              style: TextStyle(
                color: widget.constructorArguments.subjectFontColor,
                fontWeight: FontWeight.w600
              ),
              //backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            centerTitle: true,

          ),

          // main body displaying the question and possible answers
          body: Material(
            //color: Colors.white,
              color: const Color.fromRGBO(248, 249, 250, 1.0),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
              child: _bodyWidget
          )

        )
      )
    );

  }

  // functions extracts the single questions from the given question set
  void _loadCurrentQuestion() {
    _currentTitle = widget.constructorArguments.questions[_currentQuestion].title ?? '';
    _bodyWidget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                        child: Text.rich(
                            TextSpan(
                                children: _getQuestionInlineMath(),
                                style: const TextStyle(
                                  //fontSize: 18,
                                  height: 1.7,
                                )
                            )
                        ),
                      ),
                      if(_getEquationText() != '')
                        Container(
                            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                            child: Center(
                                child: Math.tex(
                                    _getEquationText(),
                                    mathStyle: MathStyle.display,
                                    textStyle: const TextStyle(fontSize: 20)
                                )
                            )
                        ),
                      if(_questionHasImage())
                        Container(
                            constraints: BoxConstraints(maxHeight: 320),
                            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                            child: Center(child: SvgPicture.string(widget.constructorArguments.questions[_currentQuestion].image!))
                        ),

                      // build list tiles with selectable answers (max 5)
                      for(int i = 0; i < widget.constructorArguments.questions[_currentQuestion].numberOfAnswers!; ++i)


                      // the selectable options display either an equation or pure text
                        if(_answerIsEquation(_currentQuestion, i))
                          Container(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),

                              child: Container(
                                //padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  constraints: const BoxConstraints(
                                    minHeight: 50.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        width: _getBorderWidth(i),
                                        color: _getTileColor(i),
                                      )
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        if(!_answerSelected) {
                                          _tileOnChanged(i);
                                          _evaluateAnswer();
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(20.0),
                                      //overlayColor: MaterialStateProperty.all(Colors.transparent),
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                          child: Math.tex(
                                            _stripEquationDelimiters(_getAnswerText(_currentQuestion, i)),
                                            mathStyle: MathStyle.display,
                                            //textAlign: TextAlign.left,
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              height: 1.6,
                                            ),
                                          )
                                      )
                                  )
                              )
                          )
                        else
                          Container(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all<double>(0.0),
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    minimumSize: MaterialStateProperty.all(const Size(195.0, 50.0)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        )
                                    ),
                                    side: MaterialStateProperty.all<BorderSide>(BorderSide(
                                      color: _getTileColor(i),
                                      width: _getBorderWidth(i),
                                    )),
                                    overlayColor: MaterialStateProperty.resolveWith(
                                          (states) {
                                        return states.contains(MaterialState.pressed)
                                            ? const Color.fromRGBO(235, 241, 245, 1.0)
                                            : null;
                                      },
                                    ),
                                  ),
                                  onPressed: () {
                                    if(!_answerSelected) {
                                      _tileOnChanged(i);
                                      _evaluateAnswer();
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                                    child: Text(
                                        _getAnswerText(_currentQuestion, i),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            height: 1.6
                                        )
                                    ),
                                  )
                              )
                          ),
                      if(_answerSelected)
                        Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                                _feedback,
                                style: TextStyle(
                                    color: _feedbackColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                )
                            )
                        ),
                      if(_answerSelected)
                        Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                            child: Text(
                                _getHintOrSolutionTitle(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                )
                            )
                        ),
                      if(_answerSelected)
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                          child: Text.rich(
                              TextSpan(
                                  children: _getHintOrSolutionInlineMath(),
                                  style: TextStyle(
                                    //fontSize: 16,
                                    height: 1.7,
                                  )
                              )
                          ),
                        ),
                    ]
                )
            )
        ),

        // final button to evaluate answer and go to the next question
        if(_answerSelected)
          if(_currentQuestion < (widget.constructorArguments.questions.length - 1))
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0.0),
                  backgroundColor: MaterialStateProperty.all(widget.constructorArguments.subjectFontColor),
                  minimumSize: MaterialStateProperty.all(const Size(195.0, 50.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )
                  )
                ),
                onPressed: () {
                  ++_currentQuestion;
                  _currentOption = Answers.dummy;
                  _answerSelected = false;
                  _answerCorrect = false;
                  _loadCurrentQuestion();
                  setState(() {});
                },
                child: Text(
                  'Weiter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0.0),
                  backgroundColor: MaterialStateProperty.all(widget.constructorArguments.subjectFontColor),
                  minimumSize: MaterialStateProperty.all(const Size(195.0, 50.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )
                  )
                ),
                onPressed: () {
                  _finishExercise();
                },
                child: const Text(
                  'Weiter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  )
                ),
              )
            )

      ]

    );
  }


  // answer tiles properties
  Color _getTileColor(int answerIndex) {
    Color answerTileColor = const Color.fromRGBO(216, 216, 216, 50);
    if(_answerSelected) {
      if(_answerCorrect && (answerIndex == _currentOption?.index)) {
        answerTileColor = Colors.green;
      } else if(!_answerCorrect && (answerIndex == _currentOption?.index)) {
        answerTileColor = Colors.red;
      }
    } else {
      if(answerIndex == _currentOption?.index) {
        //answerTileColor = const Color.fromRGBO(216, 216, 216, 50);
        answerTileColor = Colors.grey;
      }
    }
    return answerTileColor;
  }

  double _getBorderWidth(int answerIndex) {
    double width = 1.0;
    if(answerIndex == _currentOption?.index) {
      width = 2.0;
    }
    return width;
  }

  bool _getToggleable() {
    bool tileIsToggleable = true;
    if(_answerSelected) {
      tileIsToggleable = false;
    }
    return tileIsToggleable;
  }

  void _tileRadioOnChanged(Answers? value) {
    if(!_answerSelected) {
      _currentOption = value;
      _loadCurrentQuestion();
      setState(() {});
    }
  }

  void _tileOnChanged(int answerIndex) {
    if(!_answerSelected) {
      _currentOption = Answers.values[answerIndex];
      _loadCurrentQuestion();
      setState(() {});
    }
  }

  // evaluate the selected answer of the user
  void _evaluateAnswer() {
    int _selectedAnswerIndex = _currentOption?.index ?? -1;
    _feedback = 'Falsch.';
    _feedbackColor = Colors.red;
    if(_selectedAnswerIndex == widget.constructorArguments.questions[_currentQuestion].correctAnswer) {
      _answerCorrect = true;
      _feedback = 'Richtig!';
      _feedbackColor = Colors.green;
      ++_correctAnswersCount;
    }
    if(_currentOption != Answers.dummy) {
      _answerSelected = true;
      _loadCurrentQuestion();
      //debugPrint('Question number $_currentQuestion, given answer is $_answerCorrect. Number of correct Answers: $_correctAnswersCount / ${widget.questions.length}');
      setState(() {});
    }
  }

  // check the star rating of the completed questions and sends it back to calling page
  void _finishExercise() {

    // evaluate total user performance
    double correctAnswerPercentage = _correctAnswersCount / widget.constructorArguments.questions.length;
    int starRating = 0;
    String totalFeedbackGrade = 'Du musst noch etwas üben.';
    String totalFeedbackText = ' Du hast $_correctAnswersCount von ${widget.constructorArguments.questions.length} richtig beantwortet.';
    _currentTitle = 'Ergebnis';
    if(correctAnswerPercentage >= 1) {
      starRating = 3;
      totalFeedbackGrade = 'Sehr gut!';
    } else if(correctAnswerPercentage >= 0.75) {
      totalFeedbackGrade = 'Gut!';
      starRating = 2;
    } else if(correctAnswerPercentage >= 0.5) {
      starRating = 1;
    }

    // prepare feedback stars
    List<Icon> stars = [
      Icon(Icons.star_border_outlined, size: 32),
      Icon(Icons.star_border_outlined, size: 32),
      Icon(Icons.star_border_outlined, size: 32),
    ];
    if(starRating == 1) {
      stars[0] = Icon(Icons.star_outlined, size: 32);
    } else if(starRating == 2) {
      stars[0] = Icon(Icons.star_outlined, size: 32);
      stars[1] = Icon(Icons.star_outlined, size: 32);
    } else if(starRating == 3) {
      stars[0] = Icon(Icons.star_outlined, size: 32);
      stars[1] = Icon(Icons.star_outlined, size: 32);
      stars[2] = Icon(Icons.star_outlined, size: 32);
    }

    _bodyWidget = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Text(
                      totalFeedbackGrade,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      )
                    ),
                  ),
                  Text(
                    totalFeedbackText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.6
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: stars
                    )
                  )
                ]
              )
            )
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                backgroundColor: MaterialStateProperty.all(widget.constructorArguments.subjectFontColor),
                minimumSize: MaterialStateProperty.all(const Size(195.0, 50.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )
                )
              ),
              onPressed: () {
                Navigator.pop(context, starRating);
              },
              child: Text(
                'Abschließen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                )
              ),
            )
          )
        ]
    );
    setState(() {});
  }

  String _getDescriptionText() {
    String descriptionStr = widget.constructorArguments.questions[_currentQuestion].description ?? '';
    if(descriptionStr == 'na') descriptionStr = '';
    return descriptionStr;
  }

  String _getEquationText() {
    String equationStr = widget.constructorArguments.questions[_currentQuestion].equation ?? '';
    if(equationStr == 'na') equationStr = '';
    return equationStr;
  }

  bool _answerIsEquation(int questionIndex, int answerIndex) {
    bool answerIsEquation = false;
    String answerStr = _getAnswerText(questionIndex, answerIndex);
    if(answerStr[0] == r'$') {
      answerIsEquation = true;
    }
    return answerIsEquation;
  }

  String _stripEquationDelimiters(String inputStr) {
    String noDelimiterStr = inputStr.replaceAll(r'$', '');
    return noDelimiterStr;
  }

  String _getHintOrSolutionTitle() {
    String hintOrSolutionTitle = 'Hinweis:';
    if(_answerCorrect) {
      hintOrSolutionTitle = 'Lösung:';
    }
    return hintOrSolutionTitle;
  }

  String _getHintOrSolutionText() {
    String hintOrSolution = widget.constructorArguments.questions[_currentQuestion].hint ?? '';
    if(_answerCorrect) {
      hintOrSolution = widget.constructorArguments.questions[_currentQuestion].description ?? '';
    }
    return hintOrSolution;
  }

  bool _questionHasImage() {
    bool questionHasImage = false;
    String svgRaw = widget.constructorArguments.questions[_currentQuestion].image ?? '';
    //debugPrint(svgRaw);
    if((svgRaw.length > 5)) {
      questionHasImage = true;
    }
    //debugPrint('Question has title $questionHasImage');
    return questionHasImage;
  }

  // TODO: MERGE INLINE MATH METHODS
  List<InlineSpan> _getQuestionInlineMath() {
    List<InlineSpan> questionSpan = [];
    String completeQuestion = widget.constructorArguments.questions[_currentQuestion].question ?? '';
    List<String> questionBlocks = completeQuestion.split(r'$');
    bool firstBlockIsMath = false;
    if((questionBlocks.length > 1) && (questionBlocks[0] == r'$')) {
      firstBlockIsMath = false;
    }
    for(int i = 0; i < questionBlocks.length; ++i) {

      // odd indices are math widgets
      if((i % 2) != 0) {
        questionSpan.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Math.tex(
              questionBlocks[i],
              mathStyle: MathStyle.text,
              textStyle: const TextStyle(
                color: Colors.black,
                //fontWeight: FontWeight.w600,
                textBaseline: TextBaseline.alphabetic,
                fontSize: 19,
                height: 1.6
              ),
            )
          )
        );
      }

      // even indices are pure text
      else {
        questionSpan.add(
          TextSpan(
            text: questionBlocks[i],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w600,
              textBaseline: TextBaseline.alphabetic,
            )
          )
        );
      }
    }
    return questionSpan;
  }

  List<InlineSpan> _getHintOrSolutionInlineMath() {
    List<InlineSpan> hintOrSolutionSpan = [];
    String hintOrSolution = widget.constructorArguments.questions[_currentQuestion].hint ?? '';
    if(_answerCorrect) {
      hintOrSolution = widget.constructorArguments.questions[_currentQuestion].description ?? '';
    }
    List<String> hintOrSolutionBlocks = hintOrSolution.split(r'$');
    bool firstBlockIsMath = false;
    if((hintOrSolution.length > 1) && (hintOrSolution[0] == r'$')) {
      firstBlockIsMath = false;
    }
    for(int i = 0; i < hintOrSolutionBlocks.length; ++i) {

      // odd indices are math widgets (always the case according to the split method)
      if((i % 2) != 0) {
        hintOrSolutionSpan.add(
          WidgetSpan(
            //alignment: PlaceholderAlignment.middle,
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Math.tex(
              hintOrSolutionBlocks[i],
              mathStyle: MathStyle.text,
              //textAlign: TextAlign.left,

              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                textBaseline: TextBaseline.alphabetic,
                //height: 1.6
              ),
            )
          )
        );
      }

      // even indices are pure text
      else {
        hintOrSolutionSpan.add(
          TextSpan(
            text: hintOrSolutionBlocks[i],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              textBaseline: TextBaseline.alphabetic,
            )
          )
        );
      }
    }
    return hintOrSolutionSpan;
  }

  String _getAnswerText(int questionIndex, int answerIndex) {
    String answerStr = '';
    if(answerIndex == 0) {
      answerStr = widget.constructorArguments.questions[questionIndex].answer0!;
    } else if(answerIndex == 1) {
      answerStr = widget.constructorArguments.questions[questionIndex].answer1!;
    } else if(answerIndex == 2) {
      answerStr = widget.constructorArguments.questions[questionIndex].answer2!;
    } else if(answerIndex == 3) {
      answerStr = widget.constructorArguments.questions[questionIndex].answer3!;
    } else if(answerIndex == 4) {
      answerStr = widget.constructorArguments.questions[questionIndex].answer4!;
    }
    return answerStr;
  }

}
