import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

import 'article_page_more.dart';


class SignInPagePhoneFirebase extends StatefulWidget {
  SignInPagePhoneFirebase({super.key});

  @override
  State<SignInPagePhoneFirebase> createState() => _SignInPagePhoneFirebaseState();
}

class _SignInPagePhoneFirebaseState extends State<SignInPagePhoneFirebase> {

  TextEditingController _phoneCtrl = TextEditingController();

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
      title: Text("Sign in with phone"),
    );
  }



  Widget get _buildBody {
    return Container(
      color: Colors.grey[200],
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPhoneText,
          _buildSendCodeButton
        ],
      ),
    );
  }

  get _buildPhoneText {
    return  TextField(
      keyboardType: TextInputType.number,
      autocorrect: false,
      controller: _phoneCtrl,
      decoration: InputDecoration(
          prefixText: "+885",
          hintText: "Enter phone"
      ),
    );
  }
  get _buildSendCodeButton {
    return ElevatedButton(onPressed: () {
      String number = "+855" + getOnlyPhoneNumber(_phoneCtrl.text);
      print("number : $number");
      _verifyPhone(number);
    }, child: Text("Send Code"));
  }

  String getOnlyPhoneNumber(String fullNumber){
     if(fullNumber[0] == '0'){
       return fullNumber.substring(1, fullNumber.length);
     }
     return fullNumber;
  }

  _verifyPhone(String number){
     final verificationCompleted = (auth.AuthCredential credentail) async{
       auth.UserCredential userCredential = await auth.FirebaseAuth.instance.signInWithCredential(credentail);
       onCompleted(userCredential.user);
     };
     final verificationFailed = (auth.FirebaseAuthException ex) async{
        print("Error ${ex.message}");
        onCompleted(null);
     };

     final codeSent = (String verId, [int? forceResendingToken]) async{
         _verificationId = verId;
         auth.User user = await showDialog(context:context, builder: (context) => _alertDialog);
         onCompleted(user);
     };

     final codeAutoRetrievalTimeout = (String verId) async{
       _verificationId = verId;
       onCompleted(null);
     };

     auth.FirebaseAuth.instance.verifyPhoneNumber(
       phoneNumber: number,
       timeout: Duration(seconds: 120),
       verificationCompleted: verificationCompleted,
       verificationFailed: verificationFailed,
       codeSent:  codeSent,
       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
     );
  }
  String _verificationId = "";
  var _smsCodeCtrl = TextEditingController();

  onCompleted(auth.User? user){
    if(user != null){
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ArticlePageMore(user:user)));
    }else{
      print("Error Login");
    }
  }

  get _alertDialog {
    return AlertDialog(
      title: Text("Enter Code"),
      content: TextField(
        controller: _smsCodeCtrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: "Enter code"),
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {
              auth.AuthCredential credential =
                  auth.PhoneAuthProvider.credential(
                      verificationId: _verificationId,
                      smsCode: _smsCodeCtrl.text.trim());
              auth.UserCredential userCredential = await auth
                  .FirebaseAuth.instance
                  .signInWithCredential(credential);
              Navigator.of(context).pop(userCredential.user);
            },
            child: Text("Done"))
      ],
    );
  }
}
