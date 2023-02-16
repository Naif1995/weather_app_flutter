// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condtion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Condtion _$CondtionFromJson(Map<String, dynamic> json) => Condtion(
      (json['code'] as num).toDouble(),
      json['icon'] as int,
      json['text'] ?? '' as String,
      (json['languages'] as List<dynamic>)
          .map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Languages _$LanguagesFromJson(Map<String, dynamic> json) => Languages(
      json['lang_name'] as String,
      json['lang_iso'] as String,
      json['day_text'] as String,
      json['night_text'] as String,
    );
