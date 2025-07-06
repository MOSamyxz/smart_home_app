import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(double lat, double lon);
}
