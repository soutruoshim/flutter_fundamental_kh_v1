import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v2/storages/insert_page.dart';
import 'record_model.dart';

class FirebaseHomePage extends StatefulWidget {
  const FirebaseHomePage({super.key});

  @override
  State<FirebaseHomePage> createState() => _FirebaseHomePageState();
}

class _FirebaseHomePageState extends State<FirebaseHomePage> {

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
      title: Text("Firebase"),
      actions: [IconButton(onPressed: () async {
        await Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsertPage()));
      }, icon: Icon(Icons.add))],
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: _buildFuture(),
    );
  }

  Widget _buildFuture() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("baby").snapshots(),
      builder: (index, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Firebase Error: ${snapshot.error}"));
        } else {
          if (snapshot.hasData) return _buildListView(snapshot.data!.docs);
          else return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildListView(List<DocumentSnapshot> documents){
    List<Record> recordList = documents.map((data)=>Record.fromSnapshot(data)).toList();
    return ListView.builder(
      itemCount: recordList.length,
      itemBuilder: (context, index){
        return _buildListViewItem(recordList[index]);
      },
    );
  }
  Widget _buildListViewItem(itemAtIndex){
    return Card(
      child: ListTile(
        title: Text("${itemAtIndex.name}"),
        subtitle: Text("${itemAtIndex.votes}"),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: (){
          },
        ),
      ),
    );
  }
}
