import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/counter_model.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Page"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: Container(
          child: Column(
            children: [MyButton3(), MyText(),MyButton2(),MyButton3(),MyText2(), MyText3()],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    //final CounterModel cm = Provider.of<CounterModel>(context);
    return Expanded(
        child: Center(
      child: IconButton(
        icon: Icon(
          Icons.plus_one,
          size: 30,
        ),
        onPressed: () {
          //cm.increase();
          // call one method
          Provider.of<CounterModel>(context, listen: false).increase();
        },
      ),
    ));
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    //final CounterModel counterModel = Provider.of<CounterModel>(context);
    return Expanded(
        child: Center(
      child: Text(
        //"${counterModel.counter}",
        "${Provider.of<CounterModel>(context).counter}",
        style: TextStyle(fontSize: 50),
      ),
    ));
  }
}

class MyButton2 extends StatelessWidget {
  const MyButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(
      child: Consumer<CounterModel>(
        builder: (context, cm, _) {
          return IconButton(
              onPressed: () {
                cm.increase();
              },
              icon: Icon(Icons.add));
        },
      ),
    ));
  }
}

class MyButton3 extends StatelessWidget {
  const MyButton3({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
          child: IconButton(
            icon: Icon(
              Icons.plus_one,
              size: 30,
            ),
            onPressed: () {
              context.read<CounterModel>().increase();
            },
          ),
        ));
  }
}

class MyText2 extends StatelessWidget {
  const MyText2({super.key});

  @override
  Widget build(BuildContext context) {
   int counter = context.select<CounterModel, int>((cm) => cm.counter);
    return Expanded(
        child: Center(
          child: Text(
            //"${counterModel.counter}",
            "select $counter",
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}
class MyText3 extends StatelessWidget {
  const MyText3({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
          child: Text(
            //"${counterModel.counter}",
            "watch ${context.watch<CounterModel>().counter}",
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}

