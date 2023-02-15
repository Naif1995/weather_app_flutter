import 'package:wheather_app/models/weather_model.dart';

import '../api/Api.dart';
import '../models/condtion_model.dart';
import '../static/static_value.dart';

class WeatherService {
  static WeatherService? _instance;

  factory WeatherService() => _instance ??= WeatherService._();

  WeatherService._();

  Future<Weather> getWeatherDetails(String country) async {
    var response = await Api(apiUrl: StaticValue.apiUrl)
        .dio
        .get('v1/current.json?key=9d1e974d46914bc095c190709230302&q=$country');
    return Weather.fromJson(response.data);
  }

  Future<Condtion> getIconAndCode() async {
    var response = await Api(apiUrl: StaticValue.condtionApi)
        .dio
        .get('/docs/conditions.json');
    return Condtion.fromJson(response.data);
  }

  void test() async {
    var response = await Api(apiUrl: StaticValue.testApi).dio.get('/random');
    print(response.data);
  }
}
