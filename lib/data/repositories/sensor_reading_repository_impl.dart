import 'package:smart_home_app/data/datasources/firebase_sensor_reading_datasource.dart';
import 'package:smart_home_app/domain/entities/sensor_reading_entity.dart';
import 'package:smart_home_app/domain/repositories/sensor_reading_repository.dart';

class SensorReadingRepositoryImpl implements SensorReadingRepository {
  final FirebaseSensorReadingDatasource datasource;

  SensorReadingRepositoryImpl(this.datasource);

  @override
  Future<List<SensorReadingEntity>> getSensorReadings(String sensorType) {
    return datasource.getSensorReadings(sensorType);
  }
}
