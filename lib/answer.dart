import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;

  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RaisedButton(
        onPressed: selectHandler,
        color: Colors.blue,
        child: Text('Answer 1'),
      ),
      width: double.infinity,
    );
  }
}
