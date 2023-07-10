import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/user.dart';

class AsynchronousFutureBuilderApi extends StatefulWidget {
  const AsynchronousFutureBuilderApi({super.key});

  @override
  State<AsynchronousFutureBuilderApi> createState() => _AsynchronousFutureBuilderApiState();
}
List<User> parseUser(String jsonString){
  print(jsonString);
  List list = json.decode(jsonString);
  List<User> userList = list.map((e) => User.fromJson(e)).toList();
  return userList;

}
Future<List<User>> fetchUserList() async{
  String url = "https://jsonplaceholder.typicode.com/posts?userid=5";
  http.Response response = await http.get(Uri.parse(url));
  return compute(parseUser, response.body);
}

class _AsynchronousFutureBuilderApiState extends State<AsynchronousFutureBuilderApi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text("Assynchronous"),),
         body: getFuture(),
    );
  }

  FutureBuilder getFuture(){
   return FutureBuilder<List<User>>(
     future: fetchUserList(),
     builder: (context, snapshot){
       if(snapshot.hasError){
         print("${snapshot.error.toString()}");
         return Center(child: Text("${snapshot.error.toString()}"));
       }
       if(snapshot.connectionState == ConnectionState.done){
         if(snapshot.hasData){
            return _buildListView(snapshot.data!);
         }else{
           return const Center(
             child: Text("No data"),
           );
         }
       }else{
         return const Center(child: CircularProgressIndicator(),);
       }
     },
   );
  }
  _buildListView(List<User> users){
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          return Container(
            color: Colors.white70,
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
               leading: const Icon(Icons.info),
                title: Text(
                   users[index].title!,
                  style: const TextStyle(fontSize: 20.0),
                ),
              subtitle: Text(users[index].body!),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
          );
        }
    );
  }
}
