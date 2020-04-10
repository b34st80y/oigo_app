import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oigo_app/resources/reasons.dart';
import 'package:oigo_app/services/database.dart';
import 'package:provider/provider.dart';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

var _state = ValueNotifier(0);
var sentence = ValueNotifier('...');
var sentenceStack = SentenceStack();

class SentenceStack extends ListBase<String> {
  final List<String> list = [];

  SentenceStack();

  set length(int newLength) {
    list.length = newLength;
  }

  int get length => list.length;

  String operator [](int index) => list[index];

  void operator []=(int index, String value) {
    list[index] = value;
  }

  // custom methods
  String constructSentence() {
    String temp = "";
    this.forEach((element) {
      temp += element;
      temp += " ";
    });
    return temp;
  }
}

class _EmotionsPageState extends State<EmotionsPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: (){
          String message = sentence.value;
          DatabaseService(user: user)
              .sendAllianceMessage(message);
        },
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          SizedBox(
            height: 85,
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
                  return ReasonsButtonsView(reasons: Reasons.happyReasons);
                case 3:
                  return ReasonsButtonsView(reasons: Reasons.sadReasons);
                case 4:
                  return ReasonsButtonsView(reasons: Reasons.angryReasons);
                case 5:
                  return ReasonsButtonsView(reasons: Reasons.frustratedReasons);
                case 6:
                  return ReasonsButtonsView(reasons: Reasons.worriedReasons);
                case 7:
                  return ReasonsButtonsView(reasons: Reasons.scaredReasons);
                default:
                  return Container(color: Colors.red, child: Text("ERROR"));
              }
            },
          ),
        ],
      ),
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
    return RaisedButton(
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
    );
  }
}

class ReasonsButtonsView extends StatelessWidget {
  final List<String> reasons;

  ReasonsButtonsView({this.reasons});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
            childAspectRatio: (150 / 60),
            padding: EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: reasons.map((reason) {
              if (reason == "custom") {
                return CustomReasonsButton.get(context);
              }
              return CustomButton(
                text: reason,
                color: Colors.blue[100],
                onTap: () {
                  sentenceStack.add(reason);
                  sentence.value = sentenceStack.constructSentence();
                  _state.value = 0;
                },
              );
            }).toList()));
  }
}

class PrefixButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        childAspectRatio: (150 / 60),
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          CustomButton(
            text: "I feel...",
            color: Colors.green,
            onTap: () {
              sentenceStack.clear();
              sentenceStack.add("I feel");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 1;
            },
          ),
          CustomButton(
            text: "Do you feel...?",
            color: Colors.blue,
            onTap: () {
              sentenceStack.clear();
              sentenceStack.add("Do you feel");
              sentence.value = sentenceStack.constructSentence();
              _state.value = 1;
            },
          ),
        ],
      ),
    );
  }
}

class EmotionsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        childAspectRatio: (150 / 60),
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          CustomButton(
              color: Colors.yellow,
              text: 'Happy',
              onTap: () {
                sentenceStack.add("happy");
                sentence.value = sentenceStack.constructSentence();
                _state.value = 2;
              }),
          CustomButton(
              color: Colors.blue,
              text: "Sad",
              onTap: () {
                sentenceStack.add("sad");
                sentence.value = sentenceStack.constructSentence();
                _state.value = 3;
              }),
          CustomButton(
              color: Colors.red,
              text: 'Angry',
              onTap: () {
                sentenceStack.add("angry");
                sentence.value = sentenceStack.constructSentence();
                _state.value = 4;
              }),
          CustomButton(
              color: Colors.orange,
              text: 'Frustrated',
              onTap: () {
                sentenceStack.add("frustrated");
                sentence.value = sentenceStack.constructSentence();
                _state.value = 5;
              }),
          CustomButton(
              color: Colors.purple,
              text: 'Worried',
              onTap: () {
                sentenceStack.add("worried");
                sentence.value = sentenceStack.constructSentence();
                _state.value = 6;
              }),
          CustomButton(
              color: Colors.green,
              text: 'Scared',
              onTap: () {
                sentenceStack.add("scared");
                sentence.value = sentenceStack.constructSentence();
                _state.value = 7;
              }),
        ],
      ),
    );
  }
}

class CustomReasonsButton {
  static CustomButton get(BuildContext context) {
    return CustomButton(
        text: "specify...",
        color: Colors.blue[100],
        onTap: () async {
          final String reason = await _asyncInputDialog(context);
          sentenceStack.add(reason);
          sentence.value = sentenceStack.constructSentence();
          _state.value = 0;
        });
  }

  static Future<String> _asyncInputDialog(BuildContext context) async {
    String reason = '';
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Why are you feeling this way?'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                onChanged: (value) {
                  reason = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(reason);
              },
            ),
          ],
        );
      },
    );
  }
}
