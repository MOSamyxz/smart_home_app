
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:smart_home_app/domain/entities/sensor_reading_entity.dart';
import 'package:smart_home_app/domain/usecases/sensor_reading_usecase.dart';

part 'sensor_reading_state.dart';

class SensorReadingCubit extends Cubit<SensorReadingState> {
  final SensorReadingUsecase usecase;

  SensorReadingCubit(this.usecase)
      : super(SensorReadingState(sensorsData: {}));

  Future<void> fetchMultipleSensors(List<String> sensorTypes) async {
    emit(SensorReadingState(sensorsData: {}, isLoading: true));
    try {
      final Map<String, List<SensorReadingEntity>> result = {};
      for (final sensor in sensorTypes) {
        final data = await usecase.getSensorReadings(sensor);
        result[sensor] = data;
      }
      emit(SensorReadingState(sensorsData: result));
    } catch (e) {
      emit(SensorReadingState(sensorsData: {}, error: e.toString()));
    }
  }
}
