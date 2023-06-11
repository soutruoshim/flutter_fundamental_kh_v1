import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/appbar_body_bottom.dart';
import 'package:flutter_v2_v1_kh/basic.dart';
import 'package:flutter_v2_v1_kh/classes.dart';
import 'package:flutter_v2_v1_kh/simple_scaffold.dart';

import 'collections.dart';
import 'functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Basic(),
      home:  BasicWidget(),
    );
  }
}



