import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/v2/files_shareref_securi/cach_helper.dart';
import 'package:flutter_v2_v1_kh/v2/files_shareref_securi/secure_cache_helper.dart';

import 'file_helper.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  int _counter = 0;
  FileHelper _fileHelper = FileHelper();

  int _cachCounter = 0;
  CacheHelper _cacheHelper = CacheHelper();

  int _keyCode = 0;
  SecureCachehelper _secureCachehelper = SecureCachehelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fileHelper.readCounter().then((value) {
        setState(() {
           _counter = value;
        });
    });

    _cacheHelper.init().then((value) {
        setState(() {
          _cachCounter =  _cacheHelper.read();
        });
    });

   _secureCachehelper.read().then((value) {
       setState(() {
            _keyCode = value;
       });
   });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: _buildAppBar,
       body: _buildBody,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
           setState(() {
              _counter++;
           });

           _fileHelper.writeCounter(_counter);

           _cacheHelper.init().then((value) {
             _cacheHelper.write(20);
           });

           _secureCachehelper.write(90882726);

        },
      ),
    );
  }

  AppBar get _buildAppBar{
      return AppBar(title: Text("File Page"),);
  }
  Widget get _buildBody{
     return Container(
       alignment: Alignment.center,
       child: Column(
           children: [
             Text("File Counter : ${_counter}"),
             Text("Cache Counter : ${_cachCounter}"),
             Text("KeyCode : ${_keyCode}"),
           ],
       )
     );
  }
}
