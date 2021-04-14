import 'package:flutter/material.dart';
// import './answer.dart';
// import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var questions = ['whats your favourite car', 'whatis favourite city'];
    return MaterialApp(
        title: 'Flutter Demp', theme: ThemeData(), home: MyHomePage()
//         Scaffold(
// //             appBar: AppBar(
// // //        title: Text('Hello app'),
// //               title: // الرئيسية
// //                   Text("الرئيسية",
// //                       style: const TextStyle(
// //                           color: const Color(0xffffffff),
// //                           fontWeight: FontWeight.w600,
// //                           fontFamily: "Cairo",
// //                           fontStyle: FontStyle.normal,
// //                           fontSize: 14.0),
// //                       textAlign: TextAlign.right),

// //             ),
//             body:

// // bg
//                 // Container(
//                 //     width: 360,
//                 //     height: 383,
//                 //     decoration: BoxDecoration(
//                 //       image: DecorationImage(
//                 //           image: new AssetImage('assets/images/bg.png'),
//                 //           ),
//                 //       border: Border.all(color: Colors.black12, width: 1),
//                 //     ),
//                 //     child: Center(
//                 //       child: Column(
//                 //         children: <Widget>[
//                 //           Text('data'),
//                 //           Container(
//                 //             alignment: Alignment.center,
//                 //             width: 200,
//                 //             height: 100,
//                 //             child: Image.asset('assets/images/logo.png'),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ))
//             //  Column(
//             // children: <Widget>[
//             //   Question(questions[_questionIndex]),
//             //   Answer(_answerQuestion),
//             //   Answer(_answerQuestion),
//             //   Answer(_answerQuestion),
//             // ],
//             // ),
//             )
        );
//    throw UnimplementedError();
  }
  // State<StatefulWidget> createState() {
  //   return MyAppState();
  // }
}

// class MyAppState extends State<MyApp> {
// class MyAppState extends State<MyApp> {
//   var _questionIndex = 0;

//   void _answerQuestion() {
//     setState(() {
//       _questionIndex = _questionIndex + 1;
//     });
//     print('button presed');
//   }

// @override
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('app bar'),backgroundColor: Color.fromARGB(255, 200, 122, 50),),
        body: Container(
      height: double.infinity,
      color: Color.fromARGB(255, 33, 38, 96),
      // child: Center(),
      child: Center(
        child:Image.network('assets/images/logo.png'),
      ),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: new AssetImage('assets/images/twitter.png'),
      //   ),
      // ),
    ));
  }
}
// https://w7.pngwing.com/pngs/708/311/png-transparent-icon-logo-twitter-logo-twitter-logo-blue-social-media-area-thumbnail.png
