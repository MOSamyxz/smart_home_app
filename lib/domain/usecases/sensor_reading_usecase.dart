import 'package:smart_home_app/domain/entities/sensor_reading_entity.dart';
import 'package:smart_home_app/domain/repositories/sensor_reading_repository.dart';

class SensorReadingUsecase {
  final SensorReadingRepository sensorRepository;

  SensorReadingUsecase(this.sensorRepository);

  Future<List<SensorReadingEntity>> getSensorReadings(String sensorType) {
    return sensorRepository.getSensorReadings(sensorType);
  }
}
