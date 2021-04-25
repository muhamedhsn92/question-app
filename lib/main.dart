import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './modules/login/login_screen.dart';
import './modules/messenger/messenger_screen.dart';
import './modules/users/users_screen.dart';
import './modules/counter/counter_screen.dart';
import './modules/bmi/bmi_calculator_screen.dart';
import './modules/bmi_result/bmi_result_screen.dart';
import 'layout/home_layout.dart';
import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demp',
      theme: ThemeData(),
//      home: MyHomePage(),
//      home: LoginScreen(),
//      home: MessengerScreen(),
//      home: UsersScreen(),
//      home: CounterScreen(),
//      home: BmiCalculatorScreen(),
//      home: BmiResultScreen(),
      home: HomeLayout(),
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
