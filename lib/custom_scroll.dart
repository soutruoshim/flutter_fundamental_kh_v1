
import 'package:flutter/material.dart';
class CustomScrollViews extends StatelessWidget {
  const CustomScrollViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: CustomScrollView(
           slivers:<Widget>[
                _sliverAppBar(),
                _sliverList(),
                _sliverGrid(),
                _sliverAppBarBottom()
           ]
       ),
    );
  }
  Widget _sliverList(){
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.face),
          title: Text("Item #$index"),
          subtitle: Text("Awesome Item $index"),
          trailing: const Icon(Icons.navigate_next),
        ),
      );
    }, childCount: 5));
  }
  Widget _sliverAppBar(){
    return SliverAppBar(
      leading: const Icon(Icons.menu),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        IconButton(onPressed: (){}, icon: Icon(Icons.person))
      ],
      pinned: false,
      title: const Text("Sliver App Bar"),
      floating: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [Colors.pink, Colors.indigo]
          )
        ),
      ),
      expandedHeight: 80,
    );
  }
  Widget _sliverAppBarBottom(){
    return SliverAppBar(
      leading: const Icon(Icons.menu),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        IconButton(onPressed: (){}, icon: Icon(Icons.person))
      ],
      pinned: true,
      title: const Text("Sliver App Bar"),
      //floating: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink, Colors.indigo]
            )
        ),
      ),
    );
  }

  Widget _sliverGrid(){
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.pink[100 * (index % 9)],
            child: Text("Grid Item $index"),
          );
        }, childCount: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0));
  }
}
