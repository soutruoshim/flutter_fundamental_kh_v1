import 'package:flutter/material.dart';
class ListViews extends StatelessWidget {
  const ListViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
             scrollDirection: Axis.vertical,
             children: [
               IconButton(onPressed: (){ print("Click");}, icon: Icon(Icons.home)),
               ListTile(
                 leading: Icon(Icons.wb_sunny),
                 title: Text("Sun"),
                 subtitle: Text("The sun is shinning"),
                 trailing: Icon(Icons.keyboard_arrow_right),
               ),
               ListTile(
                 leading: Icon(Icons.cloud),
                 title: Text("Sun"),
                 subtitle: Text("The sun is shinning"),
                 trailing: Icon(Icons.keyboard_arrow_right),
               ),
               ListTile(
                 leading: Icon(Icons.monetization_on),
                 title: Text("Sun"),
                 subtitle: Text("The sun is shinning"),
                 trailing: Icon(Icons.keyboard_arrow_right),
               ),
               ListTile(
                 leading: Icon(Icons.key),
                 title: Text("Sun"),
                 subtitle: Text("The sun is shinning"),
                 trailing: Icon(Icons.keyboard_arrow_right),
               )
             ],
        ),
    );
  }
}
