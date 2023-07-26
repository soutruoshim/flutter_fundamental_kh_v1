import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v2/storages/word_helper.dart';
import 'package:flutter_v2_v1_kh/v2/storages/word_model.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  WordHelper _wordRepo = WordHelper();
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _wordRepo.openDB().then((value) {
      setState(() {
        _isLoading = false;
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
      title: Text("Insert Word"),
    );
  }

  TextEditingController _englishCtrl = TextEditingController();
  TextEditingController _khmerCtrl = TextEditingController();

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
        controller: _englishCtrl,
        decoration: InputDecoration(hintText: "English word"),
      ),
      TextField(
        controller: _khmerCtrl,
        decoration: InputDecoration(hintText: "Khmer word"),
      ),
      ElevatedButton.icon(
          onPressed: () {
            WordModel wordModel = WordModel(
              id: DateTime.now().microsecond,
              english: _englishCtrl.text.trim(),
              khmer: _khmerCtrl.text.trim()
            );
            _wordRepo.insert(wordModel).then((value) {
               print("${value.id} inserted");
            });
          }, icon: Icon(Icons.add), label: Text("Enter"))
    ]);
  }
}
