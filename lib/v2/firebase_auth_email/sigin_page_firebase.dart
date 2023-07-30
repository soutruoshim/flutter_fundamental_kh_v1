import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignInPageFirebase extends StatefulWidget {
  SignInPageFirebase({super.key});

  @override
  State<SignInPageFirebase> createState() => _SignInPageFirebaseState();
}

class _SignInPageFirebaseState extends State<SignInPageFirebase> {
  bool _isLoading = false;
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      title: Text("Sign in"),
    );
  }



  Widget get _buildBody {
    return Container(
      color: Colors.grey[200],
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: _isLoading ? CircularProgressIndicator() : _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return Column(children: [
      TextField(
        controller: _emailCtrl,
        decoration: InputDecoration(hintText: "Email"),
      ),
      TextField(
        controller: _passCtrl,
        decoration: InputDecoration(hintText: "Password"),
      ),
      ElevatedButton.icon(
          onPressed: () async {
            signIn(_emailCtrl.text.trim(), _passCtrl.text.trim());
          }, icon: Icon(Icons.person), label: Text("Sign In"))
    ]);
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("login: FirebaseAuthException e.code = ${e.code}");
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
