import 'package:flutter/material.dart';
class Functions extends StatelessWidget {
  const Functions({super.key});

  @override
  Widget build(BuildContext context) {

    print("Positive number ${isPositiveNum(0)}");
    showSum(10, 12);

    showProfile("Sout Ruoshim", 20, "Male");
    showProfile2("Sout Ruoshim2", gender: "Male", age: 29);

    return Scaffold(
      appBar: AppBar(title: const Text("Functions"),),
      body: Container(color: Colors.white,),
    );
  }

  // short function
  bool isPositiveNum(int num) => num >= 0;
  void showSum(int numOne, int numTwo) => print("${numOne + numTwo}");

  // positional param
  showProfile(String name, [int age = 0, String gender = "male"]){
      print("name is $name, age = $age, gender = $gender");
  }
  //Naming optional param
  showProfile2(String name, {int age = 0, String gender = "male"}){
     print("name is $name, age = $age, gender = $gender");
  }
}
