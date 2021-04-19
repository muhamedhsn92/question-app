import 'package:flutter/material.dart';
import './login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demp',
      theme: ThemeData(),
//      home: MyHomePage(),

      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('app bar top '),
//          backgroundColor: Color.fromARGB(255, 200, 122, 50),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.greenAccent,
          child: Center(
            child: Text(
              'data',
              style: TextStyle(color: Colors.white, fontSize: 80),
            ),
          ),
        ));
  }
}
// https://w7.pngwing.com/pngs/708/311/png-transparent-icon-logo-twitter-logo-twitter-logo-blue-social-media-area-thumbnail.png
