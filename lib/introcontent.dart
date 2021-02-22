import 'package:flutter/material.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 15,
        ),
        Text(
          "ROVEASSIST",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.redAccent,
          ),
        ),
        Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Spacer(),
        Image.asset(
          image,
          height: 350,
          width: 350,
        ),
      ],
    );
  }
}
