import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v1/page_detail_listview.dart';
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fruits = ["coconut", "apple", "pear"];
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Ex"),
      ),
      body: _listView2(),
    );
  }

  Widget _listView2(){
      List<Fruit> fruits = [
          Fruit(title: "Apple", imageUrl: "https://healthjade.com/wp-content/uploads/2017/10/apple-fruit.jpg"),
          Fruit(title: "Banana", imageUrl: "https://livelife.lk/wp-content/uploads/2020/05/organic_banana_sour.jpg"),
          Fruit(title: "Coconut", imageUrl: "https://cf.ltkcdn.net/diet-and-nutrition/vegetarian-and-vegan/images/std/301601-356x337-coconut1022.jpg"),
      ];
      return ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.white,
              child: InkWell(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetailListview(fruit:fruits[index])));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Image.network(fruits[index].imageUrl, fit: BoxFit.cover,),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        fruits[index].title,
                        style: TextStyle(fontSize: 22.0),
                      ),
                    )
                  ],
                ),
              ),
            );
      });
  }
  Widget _listView(List<String> fruits){
    return ListView.builder(itemCount: 3, itemBuilder: (context, index) {
      return Container(
        padding: EdgeInsets.all(10.0),
        child: Text(fruits[index], style: TextStyle(fontSize: 22.0),),
      );
    });
  }
}



class Fruit{
  String title;
  String imageUrl;
  Fruit({this.title="", this.imageUrl=""});
}
