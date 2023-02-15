import 'package:json_annotation/json_annotation.dart';

part 'condtion_model.g.dart';


@JsonSerializable(createToJson: false)
// class CondtionList {
//   final List<Condtion> condtionList;

//   CondtionList(this.condtionList);

//   factory CondtionList.fromJson(Map<String, dynamic> json) =>
//       _$CondtionListFromJson(json);
  
// }

@JsonSerializable(createToJson: false)
class Condtion {
  final double code;
  final String icon;
  final String text;
  final List<Languages> languages;

  Condtion(this.code, this.icon, this.text, this.languages);

  factory Condtion.fromJson(Map<String, dynamic> json) =>
      _$CondtionFromJson(json);
}


@JsonSerializable(createToJson: false)
class Languages {
  final String lang_name;
  final String lang_iso;
  final String day_text;
  final String night_text;

  Languages(this.lang_name, this.lang_iso, this.day_text, this.night_text);

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);
}