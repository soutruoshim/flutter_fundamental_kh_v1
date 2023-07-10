import 'package:flutter/material.dart';
class AsynchronousFutureBuilder extends StatefulWidget {
  const AsynchronousFutureBuilder({super.key});

  @override
  State<AsynchronousFutureBuilder> createState() => _AsynchronousFutureBuilderState();
}

class _AsynchronousFutureBuilderState extends State<AsynchronousFutureBuilder> {

Future<String> getFutureFunction(){
   Future<String> data = Future.delayed(Duration(seconds: 3), ()=> "Latest News");
   return data;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text("Assynchronous"),),
         body: Container(
            color: Colors.black12,
            alignment: Alignment.center,
            child: getFuture(),
         ),
    );
  }

  FutureBuilder getFuture(){
   return FutureBuilder<String>(
     future: getFutureFunction(),
     builder: (context, snapshot){
       if(snapshot.connectionState == ConnectionState.done){
         return Container(
           child: Text(snapshot.data!),
         );
       }else{
         return Center(child: CircularProgressIndicator(),);
       }
     },
   );
  }
}
