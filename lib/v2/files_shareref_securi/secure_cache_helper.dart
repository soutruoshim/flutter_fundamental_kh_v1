import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class SecureCachehelper{
   FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
   final String _counterKey = "counter";

   void write(int value){
      _flutterSecureStorage.write(key: _counterKey, value: value.toString());
   }
   Future<int> read() async{
      String? data = await _flutterSecureStorage.read(key: _counterKey);
      return int.parse(data??"0");
   }
}