import 'package:cloud_firestore/cloud_firestore.dart';
class Record{
  late String name;
  late num votes;
  DocumentReference? reference;
  Record({this.name = "", this.votes = 0, this.reference});
  Record.fromMap(Object? object, {this.reference}){
     Map<String, dynamic>? map = object as Map<String, dynamic>?;
     name = ((map??{})['name'])??"unnamed";
     votes = ((map??{})['votes'])??"0";
  }
  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> get toMap => {
    'name': name,
    'votes': votes,
  };
  @override
  String toString() => "Record<$name:$votes>";
}