import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable(createToJson: false)
class Weather {
  final WeatherLocation location;
  final WeatherDetails current;

  Weather(this.location, this.current);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable()
class WeatherLocation {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tz_id;
  final double localtime_epoch;
  final String localtime;

  WeatherLocation(this.name, this.region, this.country, this.lat, this.lon,
      this.tz_id, this.localtime_epoch, this.localtime);

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationFromJson(json);
}

@JsonSerializable()
class WeatherDetails {
  final double last_updated_epoch ;
  final String last_updated ;
  final double temp_c ;
  final double temp_f ;
  final double is_day ;
  final WeatherCondition condition ;

  WeatherDetails(this.last_updated_epoch, this.last_updated, this.temp_c,
      this.temp_f, this.is_day, this.condition);
      
  factory WeatherDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsFromJson(json);
}


@JsonSerializable()
class WeatherCondition {
  final String text ;
  final String icon ;
  final double code ;

  WeatherCondition(this.text, this.icon, this.code);
  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);
}
