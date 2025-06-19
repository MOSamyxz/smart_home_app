import 'package:smart_home_app/data/models/sensor_model.dart';

import '../entities/sensor_entity.dart';

abstract class SensorRepository {
  Future<List<SensorEntity>> getAllSensors();
  Future<void> addSensor(SensorModel sensor);
}
