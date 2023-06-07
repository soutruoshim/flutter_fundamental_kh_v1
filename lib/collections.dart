import 'package:flutter/material.dart';
class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    List listDynamic = [];
    listDynamic.add(12);
    listDynamic.add("Hi");
    listDynamic.add(true);
    listDynamic.remove(true);
    print(listDynamic);
    print(listDynamic.isEmpty);
    print(listDynamic.length);
    print(listDynamic.contains("Hi"));

    // List data type
    List<String> listString = <String>[];
    listString.add("Hello");
    listString.add("World");
    print(listString);

    List<int> listInt = [];
    listInt.add(1);
    listInt.add(3);
    print(listInt);

    // build function with list
    List<int> numbers = [4,5,6,1,7];
    numbers.forEach((element) => print("Number: $element"));
    numbers.insert(2, 9); print(numbers);
    numbers.removeAt(0); print(numbers);
    List<int> listReverse = numbers.reversed.toList(); print(listReverse);
    numbers.sort((a, b) => a.compareTo(b)); print(numbers);
    List<int> listSearch = numbers.where((element) => element > 3).toList(); print(listSearch);


    // convert list
    List<int> numInts = [5,6,7,8,2,3];print(numInts);
    List<double> numDoubles = numInts.map((e) => e.toDouble()).toList(); print(numDoubles);
    List<String> numStrings = List.from(numInts.map((e) => e.toString())); print(numStrings);

    // map
    Map<String, dynamic> jsonData = {"id":1, "name":"sout rahim"}; print(jsonData);
    jsonData.addAll({"gender":"male"});
    jsonData.putIfAbsent("job", () => "Developer"); print(jsonData);
    print(jsonData.keys);
    print(jsonData.values);
    print(jsonData.isEmpty);
    jsonData.remove("job"); print(jsonData);
    jsonData.removeWhere((key, value) => key == "name"); print(jsonData);
    print(jsonData.containsKey("id"));
    print(jsonData.containsValue(1));

    return Scaffold(
      appBar: AppBar(title: const Text("Collection"),),
      body: Container(color: Colors.white,),
    );
  }
}
