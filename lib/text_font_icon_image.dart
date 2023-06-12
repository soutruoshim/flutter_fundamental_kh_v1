import 'package:flutter/material.dart';
class TextFontIconImage extends StatelessWidget {
  const TextFontIconImage({super.key});

  @override
  Widget build(BuildContext context) {
    final img = "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg";
     return Scaffold(
       appBar: AppBar(title: Text("អក្សរខ្មែរ", style: TextStyle(fontFamily: "khmer-mef2"),),),
       body: Center(
         child: SingleChildScrollView(
           child: Column(
             children: [
                 Icon(Icons.home, size: 50, color: Colors.pink,),
                 IconButton(onPressed: (){}, icon: Icon(Icons.place, size: 50,)),
                 Container(
                   color: Colors.orange,
                   width: 200,
                   height: 200,
                   child: Image.network(img,fit: BoxFit.contain, ),
                 )
             ],
           ),
         ),
       ),
     );
  }
}
