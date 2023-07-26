import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v2/storages/insert_page.dart';
import 'package:flutter_v2_v1_kh/v2/storages/word_helper.dart';
import 'package:flutter_v2_v1_kh/v2/storages/word_model.dart';

class Storages extends StatefulWidget {
  const Storages({super.key});

  @override
  State<Storages> createState() => _StoragesState();
}

class _StoragesState extends State<Storages> {
  WordHelper _wordRepo = WordHelper();
  bool _isLoading = true;

  late Future<List<WordModel>> _wordModelList;

  void _initWord() async {
    _wordRepo.openDB().then((value) {
      setState(() {
        _isLoading = false;
      });
      _wordModelList = _wordRepo.selectAll();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initWord();
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
      title: Text("English - Khmer"),
      actions: [IconButton(onPressed: () async {
        await Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsertPage()));
      }, icon: Icon(Icons.add))],
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: _isLoading ? CircularProgressIndicator() : _buildFuture(),
    );
  }

  Widget _buildFuture() {
    return FutureBuilder<List<WordModel>>(
        future: _wordModelList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildListView(snapshot.data ?? []);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget _buildListView(List<WordModel> items) {
    return RefreshIndicator(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildItem(items[index]);
            }),
        onRefresh: () async {
          setState(() {
            _wordModelList = _wordRepo.selectAll();
          });
        });
  }
  Widget _buildItem(WordModel item){
     return Card(
        child: ListTile(
          title: Text("${item.english}"),
          subtitle: Text("${item.khmer}"),
          trailing: IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async{
              await _wordRepo.delete(item.id!);
              setState(() {
                 _wordModelList = _wordRepo.selectAll();
              });
            },
          ),
        ),
     );
  }
}
