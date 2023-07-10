import 'package:flutter/material.dart';
class PageViews extends StatefulWidget {
  const PageViews({super.key});

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  final img1 = "https://i2.wp.com/bestoftheyear.in/wp-content/uploads/2019/06/power-ranger-movies-1.jpeg?fit=1920%2C1080&ssl=1";
  final img2 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJ1fCQC1-eDYre6BQZbKmvBl5SDd9l9GhDKg&usqp=CAU";
  final img3 = "https://cdn.vox-cdn.com/thumbor/gBGg50LIhrCSo2sb4N2BVWmyzvA=/0x0:1199x798/1400x788/filters:focal(587x176:777x366):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/53866785/MV5BNGI1MDFiZWItMjkxNi00YWM5LWE5MjMtMGZkYjA5ZDdlYzg4XkEyXkFqcGdeQXVyNDQxNjcxNQ__._V1_.0.jpg";
  int _currentIndex = 0;
  PageController scontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Page View"),),
       body: Stack(
         alignment: Alignment.center,
         children: [
           _buildPageview,
           _buildNavigations
         ],
       ),
    );
  }

  get _buildPageview{
    return Container(
      alignment: Alignment.center,
      height: 300,
      child: PageView(
        controller: scontroller,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        reverse: false,
        pageSnapping: true,
        onPageChanged: (index){
             setState(() {
                 _currentIndex = index;
             });
        },
        children: [
              Image.network(img1, fit: BoxFit.cover,),
              Image.network(img2, fit: BoxFit.cover,),
              Image.network(img3, fit: BoxFit.cover,),
        ],
      ),
    );
  }

  get _buildNavigations{
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 120, height: 120,
          child: IconButton(
             icon: Icon(Icons.navigate_before, color: Colors.white,size: 100,),
            onPressed: (){
               scontroller.animateToPage(_currentIndex - 1, duration: Duration(microseconds: 200), curve: Curves.easeInOut);
            },
          ),
        ),
        Container(
          width: 120, height: 120,
          child: IconButton(
            icon: Icon(Icons.navigate_next, color: Colors.white,size: 100,),
            onPressed: (){
              scontroller.animateToPage(_currentIndex + 1, duration: Duration(microseconds: 200), curve: Curves.easeInOut);
            },
          ),
        )
      ],
    );
  }
}
