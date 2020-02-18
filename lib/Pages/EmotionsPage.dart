import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmotionsPage extends StatefulWidget {

  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}
class _EmotionsPageState extends State<EmotionsPage> {

  String sentence = 'Text';

    @override
  Widget build(BuildContext context) {
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
              child:
              Text(
                '$sentence',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: <Widget>[
            CustomButton(color: Colors.red, text: 'Angry',
              onTap: () {
                setState(() {
                  sentence =  'Angry';
                });
              }),
            CustomButton(color: Colors.blue, text: 'Happy',
                onTap: () {
                  setState(() {
                    sentence =  'Happy';
                  });
                }),
            CustomButton(color: Colors.green, text: "Sad",
                onTap: () {
                  setState(() {
                    sentence =  'Sad';
                  });
                }),
            CustomButton(color: Colors.purple, text: 'Scared',
                onTap: () {
                  setState(() {
                    sentence =  'Scared';
                  });
                }),
            CustomButton(color: Colors.yellow, text: 'Jealous',
                onTap: () {
                  setState(() {
                    sentence =  'Jealous';
                  });
                }),
          ],
        ),
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
