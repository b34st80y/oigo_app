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
              default: return Container(color: Colors.red,);
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
              sentenceStack.add("I feel");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 1;
            },),
            CustomButton(text: "Do you feel...?", color: Colors.blue, onTap: () {
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
              sentence.value+="happy ";
              _state.value = 2;

            }),
        CustomButton(color: Colors.blue, text: "Sad",
            onTap: () {
              sentence.value+="sad ";
              _state.value = 3;

            }),
        CustomButton(color: Colors.red, text: 'Angry',
            onTap: () {
              sentence.value+="angry ";
              _state.value = 4;

            }),
        CustomButton(color: Colors.orange, text: 'Frustrated',
            onTap: () {
              sentence.value+="frustrated ";
              _state.value = 5;

            }),
        CustomButton(color: Colors.purple, text: 'Worried',
            onTap: () {
              sentence.value+="worried ";
              _state.value = 6;

            }),
        CustomButton(color: Colors.green, text: 'Scared',
            onTap: () {
              sentence.value+="scared ";
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
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "because I'm making progress", color: Colors.yellow[100], onTap: () {
          sentence.value += "because I'm making progress";
          _state.value = 0;
        },),
        CustomButton(text: "about myself", color: Colors.yellow[200], onTap: () {
          sentence.value += "about myself";
          _state.value = 0;
        },),
        CustomButton(text: "because I succeed", color: Colors.yellow[300], onTap: () {
          sentence.value += "because I succeed";
          _state.value = 0;
        },),
        CustomButton(text: "because I'm organized", color: Colors.yellow[400], onTap: () {
          sentence.value += "because I'm organized";
          _state.value = 0;
        },),
        CustomButton(text: "because of my behavior today", color: Colors.yellow[500], onTap: () {
          sentence.value += "because of my behavior today";
          _state.value = 0;
        },),
        CustomButton(text: "because you trust me", color: Colors.yellow[600], onTap: () {
          sentence.value += "because you trust me";
          _state.value = 0;
        },),
        CustomButton(text: "because I'm going to school", color: Colors.yellow[700], onTap: () {
          sentence.value += "because I'm going to school";
          _state.value = 1;
        },),
        CustomButton(text: "because I'm making a friend", color: Colors.yellow[800], onTap: () {
          sentence.value += "because I'm making a friend";
          _state.value = 0;
        },),
      ],
    );
  }
}

class SadReasonsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "about losing someone special.", color: Colors.blue[100], onTap: () {
          sentence.value += "about losing someone special.";
          _state.value = 0;
        },),
        CustomButton(text: "about loving someone who doesn't love me.", color: Colors.blue[200], onTap: () {
          sentence.value += "about loving someone who doesn't love me.";
          _state.value = 0;
        },),
        CustomButton(text: "about being lonely.", color: Colors.blue[300], onTap: () {
          sentence.value += "about being lonely.";
          _state.value = 0;
        },),
        CustomButton(text: "that you are not here.", color: Colors.blue[400], onTap: () {
          sentence.value += "that you are not here.";
          _state.value = 0;
        },),
        CustomButton(text: "that you are ignoring me.", color: Colors.blue[500], onTap: () {
          sentence.value += "that you are ignoring me.";
          _state.value = 0;
        },),
        CustomButton(text: "because I never say the right things.", color: Colors.blue[600], onTap: () {
          sentence.value += "because I never say the right things.";
          _state.value = 0;
        },),
        CustomButton(text: "because nobody likes me. ", color: Colors.blue[700], onTap: () {
          sentence.value += "because nobody likes me. ";
          _state.value = 0;
        },),
        CustomButton(text: "I am alone. ", color: Colors.blue[800], onTap: () {
          sentence.value += "I am alone. ";
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
          sentence.value += "about not getting my way.";
          _state.value = 0;
        },),
        CustomButton(text: "about being made fun of. ", color: Colors.red[200], onTap: () {
          sentence.value += "about being made fun of. ";
          _state.value = 0;
        },),
        CustomButton(text: "about being ignored.", color: Colors.red[300], onTap: () {
          sentence.value += "about being ignored.";
          _state.value = 0;
        },),
        CustomButton(text: "because you ignored me.", color: Colors.red[400], onTap: () {
          sentence.value += "because you ignored me.";
          _state.value = 0;
        },),
        CustomButton(text: "because you hurt my feelings. ", color: Colors.red[500], onTap: () {
          sentence.value += "because you hurt my feelings. ";
          _state.value = 0;
        },),
        CustomButton(text: "because you are being mean. ", color: Colors.red[600], onTap: () {
          sentence.value += "because you are being mean. ";
          _state.value = 0;
        },),
        CustomButton(text: "about what you are doing. ", color: Colors.red[700], onTap: () {
          sentence.value += "about what you are doing. ";
          _state.value = 0;
        },),
        CustomButton(text: "because you lied to me. ", color: Colors.red[800], onTap: () {
          sentence.value += "because you lied to me. ";
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
        CustomButton(text: "about losing. ", color: Colors.orange[100], onTap: () {
          sentence.value += "about losing. ";
          _state.value = 0;
        },),
        CustomButton(text: "about not being able to understand. ", color: Colors.orange[200], onTap: () {
          sentence.value += "about not being able to understand. ";
          _state.value = 0;
        },),
        CustomButton(text: "about forgetting things. ", color: Colors.orange[300], onTap: () {
          sentence.value += "about forgetting things. ";
          _state.value = 0;
        },),
        CustomButton(text: "when you treat me like im stupid. ", color: Colors.orange[400], onTap: () {
          sentence.value += "when you treat me like im stupid. ";
          _state.value = 0;
        },),
        CustomButton(text: "when you ignore me. ", color: Colors.orange[500], onTap: () {
          sentence.value += "when you ignore me. ";
          _state.value = 0;
        },),
        CustomButton(text: "when I can't exppress myself. ", color: Colors.orange[600], onTap: () {
          sentence.value += "when I can't exppress myself. ";
          _state.value = 0;
        },),
        CustomButton(text: "when I can't understand things. ", color: Colors.orange[700], onTap: () {
          sentence.value += "when I can't understand things. ";
          _state.value = 0;
        },),
        CustomButton(text: "that I'm not included. ", color: Colors.orange[800], onTap: () {
          sentence.value += "that I'm not included. ";
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
          sentence.value += "because I'm making progress";
          _state.value = 0;
        },),
        CustomButton(text: "about what people will think about me. ", color: Colors.purple[200], onTap: () {
          sentence.value += "about what people will think about me. ";
          _state.value = 0;
        },),
        CustomButton(text: "about not getting a job. ", color: Colors.purple[300], onTap: () {
          sentence.value += "about not getting a job. ";
          _state.value = 0;
        },),
        CustomButton(text: "about not having friends. ", color: Colors.purple[400], onTap: () {
          sentence.value += "about not having friends. ";
          _state.value = 0;
        },),
        CustomButton(text: "because I can't talk to people. ", color: Colors.purple[500], onTap: () {
          sentence.value += "because I can't talk to people. ";
          _state.value = 0;
        },),
        CustomButton(text: "because I'm not good at sports. ", color: Colors.purple[600], onTap: () {
          sentence.value += "because I'm not good at sports. ";
          _state.value = 0;
        },),
        CustomButton(text: "because people aren't nice to me. ", color: Colors.purple[700], onTap: () {
          sentence.value += "because people aren't nice to me. ";
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
        CustomButton(text: "that you will leave me. ", color: Colors.green[100], onTap: () {
          sentence.value += "that you will leave me. ";
          _state.value = 0;
        },),
        CustomButton(text: "that people wont like me. ", color: Colors.green[200], onTap: () {
          sentence.value += "that people wont like me. ";
          _state.value = 0;
        },),
        CustomButton(text: "of loud noises. ", color: Colors.green[300], onTap: () {
          sentence.value += "of loud noises. ";
          _state.value = 0;
        },),
        CustomButton(text: "being alone. ", color: Colors.green[400], onTap: () {
          sentence.value += "being alone. ";
          _state.value = 0;
        },),
        CustomButton(text: "of disappointing you. ", color: Colors.green[500], onTap: () {
          sentence.value += "of disappointing you. ";
          _state.value = 0;
        },),
        CustomButton(text: "because I am all alone. ", color: Colors.green[600], onTap: () {
          sentence.value += "because I am all alone.";
          _state.value = 0;
        },),
        CustomButton(text: "because I think I will fail. ", color: Colors.green[700], onTap: () {
          sentence.value += "because I think I will fail. ";
          _state.value = 0;
        },),
      ],
    );
  }
}



