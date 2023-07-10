import 'package:flutter/material.dart';
class SingleChildScrollViews extends StatelessWidget {
  const SingleChildScrollViews({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(color: Colors.cyan,child: Icon(Icons.camera, size: 100,)),
                Container(color: Colors.yellowAccent,child: Icon(Icons.account_balance, size: 100,)),
                Container(color: Colors.red,child: Icon(Icons.place, size: 100,)),
                Container(color: Colors.cyan,child: Icon(Icons.camera, size: 100,)),
                Container(color: Colors.yellowAccent,child: Icon(Icons.account_balance, size: 100,)),
                Container(color: Colors.red,child: Icon(Icons.place, size: 100,)),
                Container(color: Colors.cyan,child: Icon(Icons.camera, size: 100,)),
                Container(color: Colors.yellowAccent,child: Icon(Icons.account_balance, size: 100,)),
                Container(color: Colors.red,child: Icon(Icons.place, size: 100,))
              ],
            ),
          ),
      );
  }
}
