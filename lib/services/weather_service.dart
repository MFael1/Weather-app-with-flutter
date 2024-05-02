import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String city}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String key = 'e9aa238bbe854120a8984458232211';
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$key&q=$city&days=1');
    http.Response res = await http.get(url);
    Map<String, dynamic> data = jsonDecode(res.body);
    WeatherModel weather = WeatherModel.fromjson(data);
    return weather;
  }
}
