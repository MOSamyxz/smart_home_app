import 'package:smart_home_app/domain/entities/sensor_entity.dart';


abstract class SensorState {}

class SensorInitial extends SensorState {}

class SensorLoading extends SensorState {}

class SensorLoaded extends SensorState {
  final List<SensorEntity> sensors;

  SensorLoaded(this.sensors);
}

class SensorError extends SensorState {
  final String message;

  SensorError(this.message);
}
