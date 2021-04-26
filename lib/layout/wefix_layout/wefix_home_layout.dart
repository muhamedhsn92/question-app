import 'package:flutter/material.dart';

class WefixHomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.red,
      //       title: Text('title'),
      // ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.red,
                height: 120,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.navigation_sharp,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'القاهره ',
                    fillColor: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
