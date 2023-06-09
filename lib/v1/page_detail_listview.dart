import 'package:flutter/material.dart';
import 'list_view_builder.dart';
class PageDetailListview extends StatelessWidget {
  Fruit fruit;
  PageDetailListview({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(title: Text(fruit.title),),
         body: Container(
             alignment: Alignment.center,
             child: Image.network(fruit.imageUrl),
         ),
     );
  }
}
