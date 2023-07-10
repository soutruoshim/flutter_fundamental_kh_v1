import 'package:flutter/material.dart';
class Asynchronous extends StatefulWidget {
  const Asynchronous({super.key});

  @override
  State<Asynchronous> createState() => _AsynchronousState();
}

class _AsynchronousState extends State<Asynchronous> {
  Future? sayHello(String name){
     print("Hello $name");
  }
  Future<String> getOnlyDate(DateTime now){
     int year = now.year;
     int month = now.month;
     int day = now.day;
     return Future.value("$year/$month/$day");
  }


  void someFunctions() async{
     String someDate = await getOnlyDate(DateTime.now());
     print("async await $someDate");
  }


  @override
  Widget build(BuildContext context) {
    // future call function
    sayHello("Sout Ruoshim");
    getOnlyDate(DateTime.now()).then((value){
        String someDate = value;
        print(someDate);
    });

    // future object
    Future<String> future = Future(() => "Latest new");
    future.then((value) => print(value));
    Future<String> futureDelay = Future.delayed(Duration(seconds: 2), ()=> "Latest delay");
    future.then((value) => print(value));


    // call async await
    someFunctions();
    return Scaffold(
         appBar: AppBar(title: Text("Assynchronous"),),
         body: Container(
            color: Colors.black12,
         ),
    );
  }
}
