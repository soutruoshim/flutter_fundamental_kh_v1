import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier{
   int _counter = 0;
   int get counter => _counter;

   void increase(){
      _counter++;
      notifyListeners();
   }
}