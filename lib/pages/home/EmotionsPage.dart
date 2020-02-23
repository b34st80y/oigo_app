import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

var _state = ValueNotifier(0);
var sentence = ValueNotifier('...');
var sentenceStack = SentenceStack();

class SentenceStack extends ListBase<String> {
  final List<String> l = [];
  SentenceStack();

  set length(int newLength) { l.length = newLength; }
  int get length => l.length;
  String operator [](int index) => l[index];
  void operator []=(int index, String value) { l[index] = value; }

  // your custom methods
  String constructSentence (){
    String temp = "";
    this.forEach((element) {
      temp+= element;
      temp+= " ";
    });
    return temp;
  }
}

class _EmotionsPageState extends State<EmotionsPage> {
      @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.grey,
            ),
            child: Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
              child: ValueListenableBuilder(
                valueListenable: sentence,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value),
                  );
                },
              ),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _state,
          builder: (context, value, child) {
            switch (value) {
              case 0:
                return PrefixButtons();
              case 1:
                return EmotionsButtons();
              case 2:
                return HappyReasonsButtons();
              case 3:
                return SadReasonsButtons();
              case 4:
                return AngryReasonsButtons();
              case 5:
                return FrustratedReasonsButtons();
              case 6:
                return WorriedReasonsButtons();
              case 7:
                return ScaredReasonsButtons();
              default:
                return Container(color: Colors.red, child: Text("ERROR"));
            }
          },
        ),
      ],
    );
  }
}

class PrefixButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            CustomButton(text: "I feel...", color: Colors.green, onTap: () {
              sentenceStack.clear();
              sentenceStack.add("I feel");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 1;
            },),
            CustomButton(text: "Do you feel...?", color: Colors.blue, onTap: () {
              sentenceStack.clear();
              sentenceStack.add("Do you feel");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 1;
            },),
          ],
        ),
      ],
    );
  }
}

class EmotionsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(color: Colors.yellow, text: 'Happy',
            onTap: () {
              sentenceStack.add("happy");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 2;

            }),
        CustomButton(color: Colors.blue, text: "Sad",
            onTap: () {
              sentenceStack.add("sad");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 3;

            }),
        CustomButton(color: Colors.red, text: 'Angry',
            onTap: () {
              sentenceStack.add("angry");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 4;

            }),
        CustomButton(color: Colors.orange, text: 'Frustrated',
            onTap: () {
              sentenceStack.add("frustrated");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 5;

            }),
        CustomButton(color: Colors.purple, text: 'Worried',
            onTap: () {
              sentenceStack.add("worried");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 6;

            }),
        CustomButton(color: Colors.green, text: 'Scared',
            onTap: () {
              sentenceStack.add("scared");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 7;

            }),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onTap;

  CustomButton({this.color, this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 60,
          width: 150,
          child: RaisedButton(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            color: color,
            onPressed: () {
              onTap();
            },
          ),
        )
    );
  }
}

class HappyReasonsButtons extends StatelessWidget {

  final happyReasons = [
    "because I'm making progress",
    "about myself",
    "because I succeed",
    "because I'm organized",
    "because of my behavior today",
    "because you trust me",
    "because I'm going to school",
    "because I'm making a friend",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: happyReasons.map((reason) {
        return CustomButton(text: reason, color: Colors.blue[100], onTap: () {
          sentenceStack.add(reason);
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },);
      }).toList()
    );
  }
}

class SadReasonsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "about losing someone special.", color: Colors.blue[100], onTap: () {
          sentenceStack.add("about losing someone special.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about loving someone who doesn't love me.", color: Colors.blue[200], onTap: () {
          sentenceStack.add("about loving someone who doesn't love me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about being lonely.", color: Colors.blue[300], onTap: () {
          sentenceStack.add("about being lonely.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "that you are not here.", color: Colors.blue[400], onTap: () {
          sentenceStack.add("that you are not here.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "that you are ignoring me.", color: Colors.blue[500], onTap: () {
          sentenceStack.add("that you are ignoring me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because I never say the right things.", color: Colors.blue[600], onTap: () {
          sentenceStack.add("because I never say the right things.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because nobody likes me.", color: Colors.blue[700], onTap: () {
          sentenceStack.add("because nobody likes me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "I am alone.", color: Colors.blue[800], onTap: () {
          sentenceStack.add("I am alone.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
      ],
    );
  }
}

class AngryReasonsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "about not getting my way.", color: Colors.red[100], onTap: () {
          sentenceStack.add("about not getting my way.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about being made fun of.", color: Colors.red[200], onTap: () {
          sentenceStack.add("about being made fun of.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about being ignored.", color: Colors.red[300], onTap: () {
          sentenceStack.add("about being ignored.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because you ignored me.", color: Colors.red[400], onTap: () {
          sentenceStack.add("because you ignored me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because you hurt my feelings.", color: Colors.red[500], onTap: () {
          sentenceStack.add("because you hurt my feelings.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because you are being mean.", color: Colors.red[600], onTap: () {
          sentenceStack.add("because you are being mean.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about what you are doing.", color: Colors.red[700], onTap: () {
          sentenceStack.add("about what you are doing.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because you lied to me.", color: Colors.red[800], onTap: () {
          sentenceStack.add("because you lied to me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
      ],
    );
  }
}

class FrustratedReasonsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "about losing.", color: Colors.orange[100], onTap: () {
          sentenceStack.add("about losing.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about not being able to understand.", color: Colors.orange[200], onTap: () {
          sentenceStack.add("about not being able to understand.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about forgetting things.", color: Colors.orange[300], onTap: () {
          sentenceStack.add("about forgetting things.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "when you treat me like im stupid.", color: Colors.orange[400], onTap: () {
          sentenceStack.add("when you treat me like im stupid.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "when you ignore me.", color: Colors.orange[500], onTap: () {
          sentenceStack.add("when you ignore me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "when I can't exppress myself.", color: Colors.orange[600], onTap: () {
          sentenceStack.add("when I can't exppress myself.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "when I can't understand things.", color: Colors.orange[700], onTap: () {
          sentenceStack.add("when I can't understand things.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "that I'm not included.", color: Colors.orange[800], onTap: () {
          sentenceStack.add("that I'm not included.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
      ],
    );
  }
}

class WorriedReasonsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "about how I look", color: Colors.purple[100], onTap: () {
          sentenceStack.add("about how I look");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about what people will think about me.", color: Colors.purple[200], onTap: () {
          sentenceStack.add("about what people will think about me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about not getting a job.", color: Colors.purple[300], onTap: () {
          sentenceStack.add("about not getting a job.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "about not having friends.", color: Colors.purple[400], onTap: () {
          sentenceStack.add("about not having friends.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because I can't talk to people.", color: Colors.purple[500], onTap: () {
          sentenceStack.add("because I can't talk to people.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because I'm not good at sports.", color: Colors.purple[600], onTap: () {
          sentenceStack.add("because I'm not good at sports.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because people aren't nice to me.", color: Colors.purple[700], onTap: () {
          sentenceStack.add("because people aren't nice to me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
      ],
    );
  }
}

class ScaredReasonsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "that you will leave me.", color: Colors.green[100], onTap: () {
          sentenceStack.add("that you will leave me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "that people wont like me.", color: Colors.green[200], onTap: () {
          sentenceStack.add("that people wont like me.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "of loud noises.", color: Colors.green[300], onTap: () {
          sentenceStack.add("of loud noises.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "of being alone.", color: Colors.green[400], onTap: () {
          sentenceStack.add("of being alone.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "of disappointing you.", color: Colors.green[500], onTap: () {
          sentenceStack.add("of disappointing you.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because I am all alone.", color: Colors.green[600], onTap: () {
          sentenceStack.add("because I am all alone.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
        CustomButton(text: "because I think I will fail.", color: Colors.green[700], onTap: () {
          sentenceStack.add("because I think I will fail.");
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        },),
      ],
    );
  }
}



