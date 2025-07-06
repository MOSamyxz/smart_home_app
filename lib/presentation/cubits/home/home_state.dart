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
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
