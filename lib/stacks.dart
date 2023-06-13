import 'package:flutter/material.dart';
class Stacks extends StatelessWidget {
  const Stacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
           children: [
              Container(
                color: Colors.blue,
                width: 500,
                height: 500,
                child: Icon(Icons.map, size: 300,),
              ),
             Container(
               color: Colors.yellowAccent,
               width: 300,
               height: 300,
               child: Icon(Icons.map, size: 200,),
             ),
             Container(
               color: Colors.pink,
               width: 200,
               height: 200,
               child: Icon(Icons.map, size: 100,),
             ),
          Positioned(
             right: 10.0,
              bottom: 10.0,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
          ))
        ],
      ) ,
    );
  }
}
