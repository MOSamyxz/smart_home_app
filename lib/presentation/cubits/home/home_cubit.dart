import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:smart_home_app/data/models/device_model.dart';
import 'package:smart_home_app/domain/entities/device_entity.dart';
import 'package:smart_home_app/domain/entities/weather.dart';
import 'package:smart_home_app/domain/repositories/weather_repository.dart';
import 'package:smart_home_app/presentation/cubits/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/device_repository.dart';
class HomeCubit extends Cubit<HomeState> {
  final DeviceRepository deviceRepository;
  final WeatherRepository weatherRepository;
Weather? _weather;

  HomeCubit(this.deviceRepository, this.weatherRepository) : super(HomeInitial());

  List<DeviceEntity> _devices = [];

  void init() {
    emit(HomeLoading());
    loadDevices();
    streamDevices();
    // Load weather data if needed
_initWeather()  ;
  }
  Future<void> loadDevices() async {
    emit(HomeLoading());
    try {
      _devices = await deviceRepository.getAllDevices();
 emit(HomeLoaded(
      devices: _devices,
      weather: _weather,
      loadingHomeIds: {},
    ));    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
StreamSubscription? _devicesSubscription;

void streamDevices() {
  _devicesSubscription?.cancel();
  _devicesSubscription = deviceRepository.streamAllDevices().listen((devices) {
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

  Future<void> addDevice(DeviceEntity device) async {
    try {
      await deviceRepository.addDevice(DeviceModel.fromEntity(device));
      _devices.add(device);
      emit(HomeLoaded(
        devices: List.from(_devices),
        weather: _weather,
        loadingHomeIds: {},
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> updateDevice(DeviceEntity device, bool isActive) async {
    if (state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;
    final updatedLoadingIds = Set<String>.from(currentState.loadingHomeIds)..add(device.id);
emit(HomeLoaded(
  devices: List.from(_devices),
  weather: _weather,
  loadingHomeIds: updatedLoadingIds,
));

    try {
      await deviceRepository.updateDevice(DeviceModel.fromEntity(device), isActive);
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index] = device.copyWith(isActive: isActive);
      }
    } catch (e) {
      emit(HomeError(e.toString()));
      return;
    }

    final afterUpdateLoadingIds = Set<String>.from(updatedLoadingIds)..remove(device.id);
      emit(HomeLoaded(
      devices: List.from(_devices),      weather: _weather,
 loadingHomeIds: afterUpdateLoadingIds));
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
