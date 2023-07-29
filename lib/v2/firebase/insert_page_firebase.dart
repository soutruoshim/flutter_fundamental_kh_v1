import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v2/firebase/record_model.dart';

class InsertPageFirebase extends StatefulWidget {
  const InsertPageFirebase({super.key,});

  @override
  State<InsertPageFirebase> createState() => _InsertPageFirebaseState();
}

class _InsertPageFirebaseState extends State<InsertPageFirebase> {
  bool _isLoading = false;
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
      title: Text("Insert Vote"),
    );
  }

  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _voteCtrl = TextEditingController();

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
        controller: _nameCtrl,
        decoration: InputDecoration(hintText: "Name"),
      ),
      TextField(
        controller: _voteCtrl,
        decoration: InputDecoration(hintText: "Vote"),
      ),
      ElevatedButton.icon(
          onPressed: () {
            Record record = Record(
                 name: _nameCtrl.text.trim(),
                 votes: num.parse(_voteCtrl.text.trim())
            );
            insertRecord(record);

          }, icon: Icon(Icons.add), label: Text("Enter"))
    ]);
  }
  Future insertRecord(Record record){
    return FirebaseFirestore.instance.runTransaction((trx) async{
      CollectionReference colRef =
      FirebaseFirestore.instance.collection("baby");
      await colRef.add(record.toMap);
    }).then((x) => print("inserted"));
  }
}
