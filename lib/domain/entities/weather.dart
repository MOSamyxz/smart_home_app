class Weather {
  final double temperature;
  final double feelsLike;

  final String condition;
  final double humidity;
  final double windSpeed;
  final double pressure;
  final double visibility;
  final String city;
  Weather({required this.temperature, 
  required this.condition ,
  required this.city, 
  required this.humidity, 
  required this.windSpeed, 
  required this.pressure, 
  required this.visibility,
  required this.feelsLike
  });
}