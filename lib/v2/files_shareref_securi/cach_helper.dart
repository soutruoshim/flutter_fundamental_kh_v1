import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
    late SharedPreferences _preferences;
    final String _counterKey = "counter";

    Future init() async{
       _preferences = await SharedPreferences.getInstance();
    }

    Future<bool> write(int value){
       return _preferences.setInt(_counterKey, value);
    }

    int read(){
       return _preferences.getInt(_counterKey)??0;
    }
}