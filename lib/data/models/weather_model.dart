import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.temperature, 
    required super.feelsLike,
    required super.condition,
    required super.city,
    required super.humidity,
    required super.windSpeed,
    required super.pressure,
    required super.visibility,
    });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      visibility: (json['visibility'] ?? 10000).toDouble(), // Default to 10km if not provided
      condition: json['weather'][0]['main'],
      city: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'main': {
        'temp': temperature,
        'feels_like': feelsLike,
        'humidity': humidity,
        'pressure': pressure,
      },
      'wind': {
        'speed': windSpeed,
      },
      'visibility': visibility,
      'weather': [
        {'main': condition},
      ],
      'name': city,
    };
  }
}