import 'package:smart_home_app/data/models/sensor_model.dart';
import 'package:smart_home_app/domain/entities/sensor_entity.dart';

import '../../domain/repositories/sensor_repository.dart';
import '../datasources/firebase_sensor_datasource.dart';

class SensorRepositoryImpl implements SensorRepository {
  final FirebaseSensorDatasource datasource;

  SensorRepositoryImpl(this.datasource);

  @override
  Stream<List<SensorEntity>> streamAllSensors() {
    return datasource.streamAllSensors().map((models) {
      return models
          .map(
            (e) => SensorEntity(
              id: e.id,
              timestamp: e.timestamp,
              eventType: e.eventType,
              severity: e.severity,
              sensorType: e.sensorType,
              name: e.name,
              location: e.location,
              value: e.value,
              unit: e.unit,
            ),
          )
          .toList();
    });
  }
  
  @override
  Future<void> addSensor(SensorModel sensor) {
    // TODO: implement addSensor
    throw UnimplementedError();
  }
  
  @override
  Future<List<SensorEntity>> getAllSensors() {
    // TODO: implement getAllSensors
    throw UnimplementedError();
  }
}
