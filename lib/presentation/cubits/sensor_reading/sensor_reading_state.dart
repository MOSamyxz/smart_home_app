part of 'sensor_reading_cubit.dart';

@immutable
class SensorReadingState {
  final Map<String, List<SensorReadingEntity>> sensorsData;
  final bool isLoading;
  final String? error;

  SensorReadingState({
    required this.sensorsData,
    this.isLoading = false,
    this.error,
  });
}
