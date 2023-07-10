import 'package:flutter/material.dart';
class StatefullWidget extends StatefulWidget {
  const StatefullWidget({super.key});

  @override
  State<StatefullWidget> createState() => _StatefullWidgetState();
}

class _StatefullWidgetState extends State<StatefullWidget> {
  String text = "clicked";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){ setState(() {
                 text = "On Tap Click";
              });},
              onDoubleTap: (){
                setState(() {
                   text = "Double Tab";
                });
              },
              onLongPress: (){
                text = "Long Press";
              },
              child: Text("Event", style: TextStyle(fontSize: 20, color: Colors.blue),),
            ),
            SizedBox(height: 20,),
            Text(text, style: TextStyle(fontSize: 20),)
          ],
        )
      ),
    );
  }
}
