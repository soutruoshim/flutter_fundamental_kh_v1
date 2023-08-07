import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v1/appbar_body_bottom.dart';
import 'package:flutter_v2_v1_kh/v1/classes.dart';
import 'package:flutter_v2_v1_kh/v1/grid_view.dart';
import 'package:flutter_v2_v1_kh/v1/page_view.dart';
import 'package:flutter_v2_v1_kh/v1/providers/myscreen_proxy_provider.dart';
import 'package:flutter_v2_v1_kh/v1/simple_scaffold.dart';
import 'package:flutter_v2_v1_kh/v1/single_child_scrollview.dart';
import 'package:flutter_v2_v1_kh/v1/stacks.dart';
import 'package:flutter_v2_v1_kh/v1/statefullwidget.dart';
import 'package:flutter_v2_v1_kh/v1/text_font_icon_image.dart';
import 'package:flutter_v2_v1_kh/v2/asynchronous.dart';
import 'package:flutter_v2_v1_kh/v2/asynchronous_futurebuilder.dart';
import 'package:flutter_v2_v1_kh/v2/asynchronous_futurebuilder_api.dart';
import 'package:flutter_v2_v1_kh/v2/files_shareref_securi/file_page.dart';
import 'package:flutter_v2_v1_kh/v2/firebase/home.dart';
import 'package:flutter_v2_v1_kh/v2/firebase_auth_email/home_auth.dart';
import 'package:flutter_v2_v1_kh/v2/firebase_auth_phone/sigin_page_firebase.dart';
import 'package:flutter_v2_v1_kh/v2/storages/storages.dart';

import 'v1/collections.dart';
import 'v1/columns.dart';
import 'v1/containers.dart';
import 'v1/custom_scroll.dart';
import 'v1/functions.dart';
import 'v1/list_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   //home: const Basic(),
    //   home:  FilePage(),
    // );
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Error: ${snapshot.error}");
          return _buildMaterial(
            Scaffold(body: Center(child: Text("Error Firebase"))),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildMaterial(SignInPagePhoneFirebase());
        } else {
          return _buildMaterial(Center(
            child: Scaffold(body: CircularProgressIndicator()),
          ));
        }
      },
    );
  }
  _buildMaterial(Widget home) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: home);
  }
}



