import 'package:smart_home_app/domain/entities/device_entity.dart';
import 'package:smart_home_app/domain/entities/weather.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DeviceEntity> devices;
  final Weather? weather;
  final Set<String> loadingHomeIds;

  HomeLoaded({
    required this.devices,
    this.weather,
    this.loadingHomeIds = const {},
  });
  HomeLoaded copyWith({
    List<DeviceEntity>? devices,
    Weather? weather,
    Set<String>? loadingHomeIds,
  }) {
    return HomeLoaded(
      devices: devices ?? this.devices,
      weather: weather ?? this.weather,
      loadingHomeIds: loadingHomeIds ?? this.loadingHomeIds,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
