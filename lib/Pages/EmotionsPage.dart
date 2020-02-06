import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmotionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[400],
          child: Text(
          'String',
            style: TextStyle(
              fontSize: 25.0,

            ),
          ),
        ),
        Wrap(
          children: <Widget>[
            CustomButton(color: Colors.red, text: 'Button 1',),
            CustomButton(color: Colors.blue, text: 'Button 2',),
            CustomButton(color: Colors.green, text: 'Button 3',),
            CustomButton(color: Colors.purple, text: 'Button 4',),
            CustomButton(color: Colors.yellow, text: 'Button 5',),
          ],
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {

  Color color;
  String text;

  CustomButton({this.color, this.text});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: RaisedButton(
          child: Text(text), color: color, onPressed: () {}),
    );
  }
}
