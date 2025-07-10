import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/generated/l10n.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../../domain/entities/weather.dart';
class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({super.key, required this.weather});

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clouds':
        return WeatherIcons.cloud;
      case 'rain':
        return WeatherIcons.rain;
      case 'clear':
        return WeatherIcons.day_sunny;
      case 'snow':
        return WeatherIcons.snow;
      case 'thunderstorm':
        return WeatherIcons.thunderstorm;
      default:
        return WeatherIcons.na;
    }
  }
  String _getWeatherCondition(String condition , BuildContext context) {
    switch (condition.toLowerCase()) {
      case 'clouds':
        return S.of(context).clouds;
      case 'rain':
        return S.of(context).rain;
      case 'clear':
        return S.of(context).clear;
      case 'snow':
        return S.of(context).snow;
      case 'thunderstorm':
        return S.of(context).thunderstorm;
      default:
        return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.borderRadius + 2),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            AppColors.primary,
            AppColors.secondary,
            AppColors.tertiary,
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.primary, AppColors.secondary],
          ),
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.darkPrimary,
                    AppColors.darkSecondary,
                  ],
                ),
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.location, color: Colors.white70, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            weather.city,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        '${weather.temperature}°C',
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Text(
                        _getWeatherCondition(weather.condition ,  context) ,
                        style: const TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                  // Right icon
                  Icon(
                    _getWeatherIcon(weather.condition),
                    size: 48,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            AppSize.verticalSpacer(8.0),
            Row(
              children: [
                _buildMiniCard(S.of(context).temperature, Icons.thermostat_outlined, '${weather.feelsLike}°C'),
                const SizedBox(width: 12),
                _buildMiniCard(S.of(context).humidity, Iconsax.drop3, '${weather.humidity}%'),
                const SizedBox(width: 12),
                _buildMiniCard(S.of(context).wind, Iconsax.wind, '${weather.windSpeed} m/s'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniCard(String title, IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.tertiary.withAlpha(120),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: AppColors.darkGrey)),
          Row(
            children: [
              Icon(icon, color: AppColors.darkGrey, size: 20),
              const SizedBox(width: 4),
              Text(value, style: TextStyle(color: AppColors.darkGrey)),
            ],
          ),
        ],
      ),
    );
  }
}
