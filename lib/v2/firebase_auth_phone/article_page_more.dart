import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ArticlePageMore extends StatelessWidget {
  User? user;
  ArticlePageMore({super.key, required User user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article Page"),),
      body: Container(
        alignment: Alignment.center,
        child: Text(user!.phoneNumber!),
      ),
    );
  }
}
