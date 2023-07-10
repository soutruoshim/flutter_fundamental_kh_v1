import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'logic/counter_model.dart';
import 'logic/theme_model.dart';
class MyAppMultiProvider extends StatelessWidget {

  final List<SingleChildWidget> _provider =[
      ChangeNotifierProvider(create: (context) => CounterModel()),
      ChangeNotifierProvider(create: (context) => ThemeModel()),

  ];

  @override
  Widget build(BuildContext context) {
     return MultiProvider(providers: _provider, child: MyScreen(),);
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text("Theme")),
         body: Center(
           child: Container(
                alignment: Alignment.center,
                color: context.watch<ThemeModel>().isDark?Colors.black:Colors.white,
                child: ElevatedButton(onPressed: (){
                  context.read<ThemeModel>().setDark(!Provider.of<ThemeModel>(context, listen: false).isDark);
                }, child: Text("Set Dark"),),
           ),
         ),
       );
  }
}

