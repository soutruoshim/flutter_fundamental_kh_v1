import 'package:flutter_v2_v1_kh/providers/logic/counter_model.dart';

class CounterStringModel{
   CounterModel counterModel;
   CounterStringModel(this.counterModel);
   String get counterString{
      int c = counterModel.counter;
      return "$c item${c != 0? 's':''}";
   }
}