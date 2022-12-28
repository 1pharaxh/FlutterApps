// ignore: file_names
import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  final void Function() onPressed;
  final String answerText;
  Next(this.onPressed, this.answerText);
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        child: Text(answerText),
      ),
    );
  }
}
