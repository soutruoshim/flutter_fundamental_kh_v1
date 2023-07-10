import 'package:flutter/material.dart';
class BasicWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  BasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final img = "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg";
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: ()=>_key.currentState!.openDrawer(),),
        title: Text("Hello Flutter App"),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: (){},),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){},),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Welcome to appbar", style: TextStyle(color: Colors.black),),
          ),
        ),
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
            IconButton(onPressed: (){}, icon: Icon(Icons.play_circle)),
            IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Image.network(img)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.place),
      ),
    );
  }
}
