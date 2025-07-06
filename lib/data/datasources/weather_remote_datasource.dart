import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/constants.dart';
import '../models/weather_model.dart';

class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/weather?lat=$lat&lon=$lon&appid=$openWeatherApiKey&units=metric');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}