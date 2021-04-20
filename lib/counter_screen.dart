import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
//            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                      print('$counter');
                    });
                  },
                  child: Text(
                    'MINUS',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                      print('$counter');
                    });
                  },
                  child: Text(
                    'PLUS',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
