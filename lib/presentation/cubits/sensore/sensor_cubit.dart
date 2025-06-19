import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/data/models/sensor_model.dart';
import 'package:smart_home_app/domain/repositories/sensor_repository.dart';
import 'sensor_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final SensorRepository repository;

  SensorCubit(this.repository) : super(SensorInitial());

  Future<void> fetchSensors() async {
    emit(SensorLoading());
    try {
      final sensors =  await repository.getAllSensors();
      emit(SensorLoaded(sensors));
    } catch (e) {
      emit(SensorError(e.toString()));
    }
  }
  Future<void> addSensor(SensorModel sensor) async {
    try {
      await repository.addSensor(sensor);
      await fetchSensors(); 
    } catch (e) {
      emit(SensorError(e.toString()));
    }
  }
}
