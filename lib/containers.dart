import 'package:flutter/material.dart';
class Containters extends StatelessWidget {
  const Containters({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               height: 200,
               width: 200,
               color: Colors.orange,
               alignment: Alignment.center,
               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
               padding: EdgeInsets.all(40),
               child: Text("Hello"),
             ),
             Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.pink, Colors.red, Colors.orange]),
                  color: Colors.deepOrange,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        offset: Offset(15.0, 15.0),
                        blurRadius: 10.0)
                  ]),
            ),
             Container(
               width: 200,
               height: 200,
               transform: Matrix4.rotationZ(0.2),
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       colors: [Colors.pink, Colors.red, Colors.orange]),
                   color: Colors.deepOrange,
                   shape: BoxShape.rectangle,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.red.withOpacity(0.5),
                         offset: Offset(15.0, 15.0),
                         blurRadius: 10.0)
                   ]),
             ),
             Container(
               padding: EdgeInsets.only(left: 20, right: 20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
                 color: Colors.blueGrey.withOpacity(0.5)
               ),
               child: TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   labelText: "Enter your email",
                   hintText: "Enter your email",
                   labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                   border: InputBorder.none
                 ),
                 obscureText: false,
               ),
             )
           ],
         ),
       ) ,
     );
  }
}
