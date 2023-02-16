import 'dart:convert';

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

  Future<List<Condtion>> getIconAndCode() async {
    List<Condtion> itemsList = [];
    var response = await Api(apiUrl: StaticValue.condtionApi)
        .dio
        .get('/docs/conditions.json');
    var data = response.data;
    var condtionList = [];
    data.forEach((item) {
      itemsList.add(Condtion.fromJson(item));
    });
    return itemsList;
  }

  void test() async {
    List<Condtion> itemsList = [];
    var response = await Api(apiUrl: StaticValue.condtionApi)
        .dio
        .get('/docs/conditions.json');
    // var data = jsonDecode(response.data);

     var condtionList = response.data;
    condtionList.forEach((item) {
      print('data : ${item}');
    });
  }
}
