import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/presentation/cubits/home/home_cubit.dart';
import 'package:smart_home_app/presentation/cubits/home/home_state.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../../domain/entities/weather.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HomeLoaded && state.weather != null) {
          final Weather weather = state.weather!;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(2),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Iconsax.location,
                                  color: Colors.white70,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  weather.city,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${weather.temperature}°C',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              weather.condition,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
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
                        Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text('Feels like', style: TextStyle(color: AppColors.darkGrey)),
                            Row(
                              children: [
                                Icon(Icons.thermostat_outlined,color: AppColors.darkGrey, size: 20),
                                const SizedBox(width: 4),
                                Text('${weather.feelsLike}°C', style: TextStyle(color: AppColors.darkGrey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                                            const SizedBox(width: 16),

                     Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text('Humidity', style: TextStyle(color: AppColors.darkGrey)),
                            Row(
                              children: [
                                Icon(Iconsax.drop3,color: AppColors.darkGrey, size: 20),
                                const SizedBox(width: 4),
                                Text('${weather.humidity}%', style: TextStyle(color: AppColors.darkGrey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                     Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text('Humidity', style: TextStyle(color: AppColors.darkGrey)),
                            Row(
                              children: [
                                Icon(Iconsax.wind,color: AppColors.darkGrey, size: 20),
                                const SizedBox(width: 4),
                                Text('${weather.windSpeed} m/s', style: TextStyle(color: AppColors.darkGrey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                     
                   ])
                ],
              ),
            ),
          );
        } else if (state is HomeError) {
          return Text(
            'Weather Error: ${state.message}',
            style: TextStyle(color: Colors.red),
          );
        }
        return const Text('No weather data available');
      },
    );
  }
}
