import 'package:flutter/material.dart';
class SimpleScaffold extends StatelessWidget {
  const SimpleScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final img = "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg";
    return Scaffold(
         appBar: AppBar(title: Text("Hello Flutter App"),),
         drawer: Drawer(),
         floatingActionButton: FloatingActionButton(
           onPressed: (){},
           child: Icon(Icons.add),
         ),
         body: Container(
           alignment: Alignment.center,
           child: Image.network(img),
         ),
         bottomNavigationBar: BottomAppBar(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.home)),
               IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
             ],
           ),
         ),
    );
  }
}
