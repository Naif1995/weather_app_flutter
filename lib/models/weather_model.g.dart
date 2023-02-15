// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
      WeatherDetails.fromJson(json['current'] as Map<String, dynamic>),
    );

WeatherLocation _$WeatherLocationFromJson(Map<String, dynamic> json) =>
    WeatherLocation(
      json['name'] as String,
      json['region'] as String,
      json['country'] as String,
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['tz_id'] as String,
      (json['localtime_epoch'] as num).toDouble(),
      json['localtime'] as String,
    );

Map<String, dynamic> _$WeatherLocationToJson(WeatherLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz_id': instance.tz_id,
      'localtime_epoch': instance.localtime_epoch,
      'localtime': instance.localtime,
    };

WeatherDetails _$WeatherDetailsFromJson(Map<String, dynamic> json) =>
    WeatherDetails(
      (json['last_updated_epoch'] as num).toDouble(),
      json['last_updated'] as String,
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      (json['is_day'] as num).toDouble(),
      WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDetailsToJson(WeatherDetails instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.last_updated_epoch,
      'last_updated': instance.last_updated,
      'temp_c': instance.temp_c,
      'temp_f': instance.temp_f,
      'is_day': instance.is_day,
      'condition': instance.condition,
    };

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) =>
    WeatherCondition(
      json['text'] as String,
      json['icon'] as String,
      (json['code'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherConditionToJson(WeatherCondition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
