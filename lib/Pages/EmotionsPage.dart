import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var buttonsState = 'prefix';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {

  Widget buttonsWidget;
  var sentence = 'Starting Sentence';

    @override
  Widget build(BuildContext context) {
    switch (buttonsState)  {
      case 'prefix':
        buttonsWidget = PrefixButtons();
        break;
      case 'emotions':
        buttonsWidget = EmotionsButtons();
        break;
      case 'reasons':
        buttonsWidget = ReasonButtons();
    }

    return Column(
      children: <Widget>[
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
                color: Colors.white,
              ),
              child: Text('$sentence', style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
        buttonsWidget
      ],
    );
  }
}

class PrefixButtons extends StatefulWidget {
  @override
  _PrefixButtonsState createState() => _PrefixButtonsState();
}

class _PrefixButtonsState extends State<PrefixButtons> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        CustomButton(text: "I feel...", color: Colors.green, onTap: () {},),
        CustomButton(text: "Do you feel...?", color: Colors.blue, onTap: () {},),
      ],
    );
  }
}

class EmotionsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,);
  }
}

class ReasonButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue,);
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
