
import 'package:flutter/material.dart';
class GridViews extends StatelessWidget {
  const GridViews({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("GridView"),),
       body: _gridViewBuilder(),
     );
  }

  Widget _gridViewCount(){
    return GridView.count(crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        Container(color: Colors.pink,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
      ],);
  }

  Widget _gridViewExtent(){
    return GridView.extent(
      maxCrossAxisExtent: 100,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        Container(color: Colors.pink,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
        Container(color: Colors.yellowAccent,),
        Container(color: Colors.brown,),
        Container(color: Colors.blueGrey,),
        Container(color: Colors.blue,),
      ],);
  }

  Widget _gridViewDelegate(){
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
      children: [
        Container(color: Colors.pink,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
        Container(color: Colors.yellowAccent,),
      ],
    );
  }

  Widget _gridViewBuilder(){
    return GridView.builder(
       itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.blue[100 * (index % 9)],
            child: Text('grid item $index'),
          );
        });
  }
}
