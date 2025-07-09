import 'package:smart_home_app/domain/entities/sensor_reading_entity.dart';

abstract class SensorReadingRepository {
  Future<List<SensorReadingEntity>> getSensorReadings(String sensorType);
}
