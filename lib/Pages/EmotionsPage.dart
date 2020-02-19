import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

var _state = ValueNotifier(0);
var sentence = ValueNotifier('Text');

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
            alignment: Alignment(0,0),
            child: Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment(0,0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
              child: ValueListenableBuilder(
                valueListenable: sentence,
                builder: (context, value, child) {
                  return Text(value);
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

              default: return Container(color: Colors.red,);
            }
          },
        )
      ],
    );
  }
}

class PrefixButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "I feel...", color: Colors.green, onTap: () {
          sentence.value = "I feel ";
          _state.value = 1;
        },),
        CustomButton(text: "Do you feel...?", color: Colors.blue, onTap: () {
          sentence.value = "Do you feel ";
          _state.value = 1;
        },),
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
              sentence.value+="happy";

            }),
        CustomButton(color: Colors.blue, text: "Sad",
            onTap: () {
              sentence.value+="sad";

            }),
        CustomButton(color: Colors.red, text: 'Angry',
            onTap: () {
              sentence.value+="angry";

            }),
        CustomButton(color: Colors.orange, text: 'Frustrated',
            onTap: () {
              sentence.value+="jealous";

            }),
        CustomButton(color: Colors.purple, text: 'Worried',
            onTap: () {
              sentence.value+="worried";

            }),
        CustomButton(color: Colors.green, text: 'Scared',
            onTap: () {
              sentence.value+="scared";

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
                fontSize: 25,
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
