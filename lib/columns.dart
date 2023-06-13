import 'package:flutter/material.dart';
class Columns extends StatelessWidget {
  const Columns({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(color: Colors.cyan,child: Icon(Icons.camera, size: 100,)),
            Container(color: Colors.yellowAccent,child: Icon(Icons.account_balance, size: 100,)),
            Container(color: Colors.red,child: Icon(Icons.place, size: 100,))
          ],
       ),
     );
  }
}
