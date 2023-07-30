import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUpPageFirebase extends StatefulWidget {
  SignUpPageFirebase({super.key});

  @override
  State<SignUpPageFirebase> createState() => _SignUpPageFirebaseState();
}

class _SignUpPageFirebaseState extends State<SignUpPageFirebase> {
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
      title: Text("Sign UP"),
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
            signUp(_emailCtrl.text.trim(), _passCtrl.text.trim());
          }, icon: Icon(Icons.person), label: Text("Sign up"))
    ]);
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("signUp: FirebaseAuthException e.code = ${e.code}");
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
