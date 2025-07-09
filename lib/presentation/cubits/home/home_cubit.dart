import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:smart_home_app/domain/entities/device_entity.dart';
import 'package:smart_home_app/domain/entities/weather.dart';
import 'package:smart_home_app/domain/repositories/weather_repository.dart';
import 'package:smart_home_app/domain/usecases/device_usecase.dart';
import 'package:smart_home_app/presentation/cubits/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeCubit extends Cubit<HomeState> {
  final DeviceUsecase deviceUsecase;
  final WeatherRepository weatherRepository;
Weather? _weather;

  HomeCubit(this.deviceUsecase, this.weatherRepository) : super(HomeInitial());

  List<DeviceEntity> _devices = [];

  void init() {
    emit(HomeLoading());
    streamDevices();
    // Load weather data if needed
    _initWeather();
  }
  
StreamSubscription? _devicesSubscription;

void streamDevices() {
  _devicesSubscription?.cancel();
  _devicesSubscription = deviceUsecase.streamAllDevices().listen((devices) {
    emit(HomeLoaded(
      devices: devices,
      weather: _weather,
      loadingHomeIds: {},
    ));
    _devices = devices;
  });
}


@override
Future<void> close() {
  _devicesSubscription?.cancel();
  return super.close();
}


 Future<void> updateDevice(DeviceEntity device, bool isActive) async {
  if (state is! HomeLoaded) return;

  final currentState = state as HomeLoaded;

  // Add device to loading list
  final loadingIds = Set<String>.from(currentState.loadingHomeIds)..add(device.type);
  emit(currentState.copyWith(loadingHomeIds: loadingIds));

  try {
    // Update value in the repository
    await deviceUsecase.updateDeviceStatus(device, isActive);

    // Update the device locally
    final updatedDevices = currentState.devices.map((d) {
      return d.type == device.type ? d.copyWith(isActive: isActive) : d;
    }).toList();

    // Remove from loading and emit new state
    final updatedLoadingIds = Set<String>.from(loadingIds)..remove(device.type);
    emit(currentState.copyWith(
      devices: updatedDevices,
      loadingHomeIds: updatedLoadingIds,
    ));
  } catch (e) {
    emit(HomeError(e.toString()));
  }
}


  Future<void> _initWeather() async {
    try {
      final position = await Geolocator.getCurrentPosition(
      );
      loadWeather(position.latitude, position.longitude);
    } catch (e) {
      emit(HomeError("Failed to get location: $e"));
    }
  }

  Future<void> loadWeather(double lat, double lon) async {
  try {
    final weather = await weatherRepository.fetchWeather(lat, lon);
    _weather = weather;

    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(HomeLoaded(
        devices: currentState.devices,
        weather: _weather,
        loadingHomeIds: currentState.loadingHomeIds,
      ));
    }
  } catch (e) {
    emit(HomeError("Failed to fetch weather: $e"));
  }
}

}
