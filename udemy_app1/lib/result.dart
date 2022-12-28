import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final int resultScore;
  final void Function() restart;
  result(this.resultScore, this.restart, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('You did it! You scored $resultScore points!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(onPressed: restart, child: Text('Restart Quiz'))
        ],
      ),
    );
  }
}
