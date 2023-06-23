import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/providers/logic/counter_model.dart';
import 'package:flutter_v2_v1_kh/providers/logic/counter_string.dart';
import 'package:flutter_v2_v1_kh/providers/logic/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MyAppMultiProviderProxy extends StatelessWidget {
  final List<SingleChildWidget> _provider = [
    ChangeNotifierProvider(create: (context) => CounterModel()),
    ProxyProvider<CounterModel, CounterStringModel>(
        update: (context, counterModel, counterStringModel) {
      return CounterStringModel(counterModel);
    })
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _provider,
      child: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String counter = context.watch<CounterStringModel>().counterString;
    return Scaffold(
      appBar: AppBar(title: Text("Theme")),
      body: Center(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  "$counter",
                  style: TextStyle(fontSize: 30),
                )),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterModel>().increase();
                },
                child: Text("Increase"))
          ],
        ),
      ),
    );
  }
}
