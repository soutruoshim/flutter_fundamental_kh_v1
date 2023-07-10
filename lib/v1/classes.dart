import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
class Classes extends StatelessWidget {
  const Classes({super.key});

  @override
  Widget build(BuildContext context) {

    // setter and getter
    MyLogin myLogin = MyLogin();
    myLogin.password = "1234";
    print(myLogin.hashPassword);

    // constructor
    Student studentOne = new Student(id: 1, name: "Sout Ruoshim");
    print("Student One is ${studentOne.id}, name: ${studentOne.name}");
    // name constructor
    Student studentTwo = Student.fromMap({'id':2, 'name':'Sout Ruoshim 2'});
    print("Student Two is ${studentTwo.id}, name: ${studentTwo.name}");


    // inheritance
    Car car = Car("Toyota", "Highlender");
    print("Call method : ${car.getName}");
    print("Call override method: ${car.nameVehicle()}");

    // abstract class
    Motorcycle motorcycle = Honda();
    motorcycle.showName();

    // interface
    SimpleClass simpleClass = AnotherClass();
    simpleClass.show("Call from interface");

    // abstract to interface
    Person person = StudentSub();
    person.name = "SrhDp";
    print(person.getName());

    StudentSub studentSub = StudentSub();
    studentSub.show("From Student Sub");


    // call mixin
    Duck();

    // call back function
    print(input(5, 2, calc: (int a, int b) => sum(a, b)));
    print(input(5, 2, calc: (int a, int b) => multi(a, b)));


    return Scaffold(
      appBar: AppBar(title: const Text("Functions"),),
      body: Container(color: Colors.white,),
    );
  }

  // call back function
 int input(int a, int b, {required int Function(int c, int d) calc}){
     return calc(a, b);
 }
 int sum(int a, int b) => a + b;
 int multi(int a, int b) => a * b;

}

//setter and getter
class MyLogin{
   late String _pass;
   set password(String text){
      var bytes = utf8.encode(text);
      var digest = sha1.convert(bytes);
      _pass = digest.toString();
   }
   String get hashPassword{
       return _pass;
   }
}

// constructor
// default constructor
// parameterized constructor
// named constructor

class Student{
   late int id;
   late String name;
   // default constructor
   // Student(){
   //   id = 10;
   //   name = "sok";
   // }
   // parameterized constructor
   Student({required this.id, required this.name});
   Student.fromMap(Map<String, dynamic> map){
     id = map["id"];
     name = map["name"];
   }
}

// inheritance
class Vehicle{
  late String name;
  late String model;
  int year;
  Vehicle(this.name, this.model, [this.year = 2000]);
  nameVehicle() => name;
}
class Car extends Vehicle{
    Car(String name, String model):super(name, model);
    get getName => this.name;
    @override
    nameVehicle() {
      return this.model;
    }
}

// abstract class
abstract class Motorcycle{
   String motoName = "Motorcycle";
   void showName(); //abstract method
   int numWheel() => 2; // simple method
}
class Honda extends Motorcycle{
  @override
  void showName() {
     print("Motor name : ${super.motoName}");
  }
}

// interface need to  override all property and method in subclass
class SimpleClass{
    void show(text) => print(text);
}
class AnotherClass implements SimpleClass{
  @override
  void show(text) {
      print('Sub class : $text');
  }
}

// abstract to interface
abstract class Person{
   late String name;
   String getName();
}
class StudentSub implements Person, SimpleClass{
  @override
  late String name;
  @override
  String getName() {
     return name;
  }

  @override
  void show(text) {
    print("Student : $text");
  }
}

// Mixin
mixin Fly{
   void fly() => print("can fly");
}
mixin Swim{
  void swim() => print("Can swim");
}
class Duck with Fly, Swim{
  Duck(){
     swim();
     fly();
   }
}




