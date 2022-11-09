import 'package:flutter/material.dart';
import 'package:studyspace_content_emulator/models/ModelProvider.dart';

import 'package:katex_flutter/katex_flutter.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/ast.dart';


// Up to 5 answers are supported (dummy for initial state when no answer has been selected)
enum Answers {option1, option2, option3, option4, option5, dummy}


class SingleChoicePage extends StatefulWidget {

  // questions hold by the page
  final List<SingleChoiceQuestion> questions;

  // constructor
  const SingleChoicePage({required this.questions});

  // page state
  State<SingleChoicePage> createState() => _SingleChoicePageState();
}


class _SingleChoicePageState extends State<SingleChoicePage> {

  // changeable body widget
  Widget _bodyWidget = Center(child: CircularProgressIndicator());
  int _currentQuestion = 0;
  int _correctAnswersCount = 0;

  // parameters to track current question state
  Answers? _currentOption = Answers.dummy;
  bool _answerSelected = false;
  bool _answerCorrect = false;

  // initialize the page
  @override
  initState() {
    super.initState();
    _loadCurrentQuestion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // top app bar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, -1);
          },
        ),
        title: Text('Single Choice Question'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      // main body displaying the question and possible answers
      body: _bodyWidget
    );
  }

// functions extracts the single questions from the given question set
  void _loadCurrentQuestion() {
    _bodyWidget = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [


          // Display question information
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Text(
              widget.questions[_currentQuestion].title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18)
            ),
          ),
          Expanded(
              child: Container()  // expanded container moves answers to the bottom
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Builder(
              builder: (context) => KaTeX(
                laTeXCode: Text(
                  _getDescriptionText()
                )
              )
            )
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Math.tex(
                _getEquationText(),
                mathStyle: MathStyle.display,
                textStyle: const TextStyle(fontSize: 20)
              )
            )
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Builder(
              builder: (context) => KaTeX(
                laTeXCode: Text(
                  widget.questions[_currentQuestion].question ?? '',
                  style: Theme.of(context).textTheme.bodyText2
                )
              )
            )
          ),


          // build list tiles with selectable answers (max 5)
          for(int i = 0; i < widget.questions[_currentQuestion].numberOfAnswers!; ++i)


          // the selectable options display either an equation or pure text
            if(_answerIsEquation(_currentQuestion, i))
              InkWell(
                  onTap: () {
                    _tileOnChanged(i);
                  },
                  child: ListTile(
                      tileColor: _getTileColor(i),
                      leading: Radio<Answers>(
                          value: Answers.values[i],
                          groupValue: _currentOption,
                          toggleable: _getToggleable(),
                          onChanged: (Answers? value) {
                            _tileRadioOnChanged(value);
                          }
                      ),
                      title: Math.tex(
                        _stripEquationDelimiters(_getAnswerText(_currentQuestion, i)),
                        mathStyle: MathStyle.display,
                      )
                  )
              )
            else
              InkWell(
                  onTap: () {
                    _tileOnChanged(i);
                  },
                  child: ListTile(
                    tileColor: _getTileColor(i),
                    leading: Radio<Answers>(
                        value: Answers.values[i],
                        groupValue: _currentOption,
                        toggleable: _getToggleable(),
                        onChanged: (Answers? value) {
                          _tileRadioOnChanged(value);
                        }
                    ),
                    title: Text(
                        _getAnswerText(_currentQuestion, i)
                    ),
                  )
              ),

          // final button to evaluate answer and go to the next question
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(_answerSelected)
                if(_currentQuestion < (widget.questions.length - 1))
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('Weiter'),
                        onPressed: () {
                          ++_currentQuestion;
                          _currentOption = Answers.dummy;
                          _answerSelected = false;
                          _answerCorrect = false;
                          _loadCurrentQuestion();
                          setState(() {});
                        },
                      )
                    )
                  )
                else
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('Abschliessen'),
                        onPressed: () {
                          _finishExercise();
                        },
                        )
                      )
                  )
              else
                Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('Ok'),
                        onPressed: () {
                          _evaluateAnswer();
                        },
                      )
                  )
                )
            ]
          )
        ]

    );
  }


  // answer tiles properties
  Color _getTileColor(int answerIndex) {
    Color answerTileColor = Colors.transparent;
    if(_answerSelected) {
      if(_answerCorrect && (answerIndex == _currentOption?.index)) {
        answerTileColor = Colors.green;
      } else if(!_answerCorrect && (answerIndex == _currentOption?.index)) {
        answerTileColor = Colors.red;
      }
    } else {
      if(answerIndex == _currentOption?.index) {
        answerTileColor = Color.fromRGBO(216, 216, 216, 50);
      }
    }
    return answerTileColor;
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
    if(_selectedAnswerIndex == widget.questions[_currentQuestion].correctAnswer) {
      _answerCorrect = true;
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
    double correctAnswerPercentage = _correctAnswersCount / widget.questions.length;
    int starRating = 0;
    if(correctAnswerPercentage >= 1) {
      starRating = 3;
    } else if(correctAnswerPercentage >= 0.75) {
      starRating = 2;
    } else if(correctAnswerPercentage >= 0.5) {
      starRating = 1;
    }
    Navigator.pop(context, starRating);
  }


  String _getDescriptionText() {
    String descriptionStr = widget.questions[_currentQuestion].description ?? '';
    if(descriptionStr == 'na') descriptionStr = '';
    return descriptionStr;
  }

  String _getEquationText() {
    String equationStr = widget.questions[_currentQuestion].equation ?? '';
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

  String _getAnswerText(int questionIndex, int answerIndex) {
    String answerStr = '';
    if(answerIndex == 0) {
      answerStr = widget.questions[questionIndex].answer0!;
    } else if(answerIndex == 1) {
      answerStr = widget.questions[questionIndex].answer1!;
    } else if(answerIndex == 2) {
      answerStr = widget.questions[questionIndex].answer2!;
    } else if(answerIndex == 3) {
      answerStr = widget.questions[questionIndex].answer3!;
    } else if(answerIndex == 4) {
      answerStr = widget.questions[questionIndex].answer4!;
    }
    return answerStr;
  }

}