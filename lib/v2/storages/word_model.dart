const String databaseName = "db_dictionary";
const int databaseVersion = 1;
const String tableName = "tbl_word";
const String columnId = "id";
const String columnEnglish = "english";
const String columnKhmer = "khmer";

class WordModel {
  int? id;
  String? english;
  String? khmer;

  WordModel({this.id, this.english, this.khmer});

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
        id : json['id'],
        english : json['english'],
        khmer: json['khmer']
    );
  }

  Map<String, dynamic> get toMap => {
    columnId : id,
    columnEnglish: english,
    columnKhmer: khmer
  };
}


