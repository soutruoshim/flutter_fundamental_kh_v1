import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v2/firebase_auth_email/sigin_page_firebase.dart';
import 'package:flutter_v2_v1_kh/v2/firebase_auth_email/sign_up_page_firebase.dart';

class FirebaseAuthHomePage extends StatefulWidget {
  const FirebaseAuthHomePage({super.key});

  @override
  State<FirebaseAuthHomePage> createState() => _FirebaseAuthHomePageState();
}

class _FirebaseAuthHomePageState extends State<FirebaseAuthHomePage> {
  User? user;

  // String uid = user!.uid;
  // String? phone = user!.phoneNumber;
  // String? name = user!.displayName;
  // String? photoUrl = user!.photoURL;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // check user current login or not
    Future.delayed(Duration(seconds: 1), () {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (mounted) {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //     user != null ? MainPage() : LoginPage(),
          //   ),
          // );
          user = FirebaseAuth.instance.currentUser!;
        } else {
          user = null;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: Text("Authentication"),
    );
  }

  Widget get _buildBody {
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          user?.email != null
              ? Column(
                  children: [
                    Text("Current User ${user?.email}"),
                    ElevatedButton.icon(
                        onPressed: () async {
                          await user?.delete();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        label: Text("Delete")),
                    ElevatedButton.icon(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        icon: Icon(Icons.logout),
                        label: Text("Logout")),
                  ],
                )
              : Container(),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 26,
          ),
          ElevatedButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignInPageFirebase()));
              },
              icon: Icon(Icons.login),
              label: Text("Sign in")),
          ElevatedButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUpPageFirebase()));
              },
              icon: Icon(Icons.verified_user),
              label: Text("Sign Up"))
        ]));
  }
}
