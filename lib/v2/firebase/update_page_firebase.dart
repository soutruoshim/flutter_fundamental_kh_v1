import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v2/firebase/record_model.dart';

class UpdatePageFirebase extends StatefulWidget {
  Record? record;
  UpdatePageFirebase({super.key, required this.record});

  @override
  State<UpdatePageFirebase> createState() => _UpdatePageFirebaseState();
}

class _UpdatePageFirebaseState extends State<UpdatePageFirebase> {
  bool _isLoading = false;
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _voteCtrl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameCtrl.text = widget.record!.name;
    _voteCtrl.text =  widget.record!.votes.toString();
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
      title: Text("Update Vote"),
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
        controller: _nameCtrl,
        decoration: InputDecoration(hintText: "Name"),
      ),
      TextField(
        controller: _voteCtrl,
        decoration: InputDecoration(hintText: "Vote"),
      ),
      ElevatedButton.icon(
          onPressed: () async {
            widget.record!.name = _nameCtrl.text.toString();
            widget.record!.votes = num.parse(_voteCtrl.text.trim());
            await updateRecord(widget.record!);

          }, icon: Icon(Icons.add), label: Text("Update"))
    ]);
  }

  Future updateRecord(Record record){
    return FirebaseFirestore.instance.runTransaction((trx) async{
      trx.update(record.reference!, record.toMap);
    }).then((value)=>print("updated"));
  }
}
