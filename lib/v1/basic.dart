import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Basic extends StatelessWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var varVariable = 7.9;
    dynamic dynamicVariable = 9;

    int intVariable = 10;
    double doubleVariable = 9.90;
    bool booleanVariable = true;
    String title = "Cambodia";
    dynamic subTitle = 'Kingdom of wonder';
    print("$title, $subTitle");


    // null safety
    int? nullSafetyOne;
    nullSafetyOne??= 3;
    print(nullSafetyOne);

    nullSafetyOne = 4;
    print(nullSafetyOne);

    nullSafetyOne??= 5;
    print(nullSafetyOne); // still 3

    int? nullSafetyTwo;
    int checkVariable = nullSafetyTwo??0;
    print(checkVariable);

    // late keyword
    late int total;
    int numberOne = 2;
    int numberTwo = 3;
    total = numberOne * numberTwo;
    print(total);

    // var & dynamic (can change data type after)
    var varOne = 10;
    // varOne = "10"; can't change data type
    dynamic dynamicOne = 10;
    dynamicOne = "dynamic string";
    print(dynamicOne);


    // final(in class and out class) && const (out class)
    final double pi = 3.14;
    const double earthGravity = 9.90;
    print("Pi = $pi, earth gravity = $earthGravity");

    // conditions if
    int numberOneCondition = 20;
    int numberTwoCondition = 10;
    if(numberOneCondition < numberTwoCondition){
       print("$numberOneCondition is small then $numberTwoCondition");
    }else if(numberOneCondition > numberTwoCondition){
      print("$numberOneCondition is bigger then $numberTwoCondition");
    }else{
      print("else statement");
    }

    // ternary operator
    bool boolCheck = numberOneCondition > 0? true: false;
    bool boolCheckTwo = numberOneCondition < numberTwoCondition?true:false;
    print("bool check is $boolCheck, bool check two is $boolCheckTwo");


    // for loop
    String message = "Hello Dart";
    for(var i = 0; i< 3; i++){
       print("$i $message");
    }

    List numbers = [0, 3, 2,6];
    for(var x in numbers){
       print(x);
    }

    // while && do while
    int order = 1;
    while(order < 5){
      print("while order ${order++}");
    }
    do{
      print("do while order ${order--}");
    }while(order > 1);

    // break and continue
    int orderBreak = 1;
    while(orderBreak<10){
       if(orderBreak  == 5) break;
       print("order break ${orderBreak++}");
    }
    int orderContinue = 1;
    while(orderContinue < 10){
      orderContinue++;
      if(orderContinue == 5) continue;
      print("order continue ${orderContinue}");
    }

    var orderSwitch = 1;
    switch(orderSwitch){
      case 1: print("Case 1: $orderSwitch"); break;
      case 2: print("Case 2: $orderSwitch"); break;
      default: print("default");
    }

    return Scaffold(
        appBar: AppBar(title: const Text("Basic"),),
        body: Container(color: Colors.white,),
    );
  }
}
