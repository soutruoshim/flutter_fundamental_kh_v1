import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/appbar_body_bottom.dart';
import 'package:flutter_v2_v1_kh/basic.dart';
import 'package:flutter_v2_v1_kh/classes.dart';
import 'package:flutter_v2_v1_kh/grid_view.dart';
import 'package:flutter_v2_v1_kh/page_view.dart';
import 'package:flutter_v2_v1_kh/simple_scaffold.dart';
import 'package:flutter_v2_v1_kh/single_child_scrollview.dart';
import 'package:flutter_v2_v1_kh/stacks.dart';
import 'package:flutter_v2_v1_kh/statefullwidget.dart';
import 'package:flutter_v2_v1_kh/text_font_icon_image.dart';

import 'collections.dart';
import 'columns.dart';
import 'containers.dart';
import 'functions.dart';
import 'list_view.dart';
import 'list_view_builder.dart';

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
      home:  PageViews(),
    );
  }
}



