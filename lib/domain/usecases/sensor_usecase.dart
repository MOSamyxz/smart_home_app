import 'package:smart_home_app/domain/entities/sensor_entity.dart';
import 'package:smart_home_app/domain/repositories/sensor_repository.dart';

class SensorUsecase {
  final SensorRepository sensorReadingRepository;

  SensorUsecase(this.sensorReadingRepository);

    Stream<List<SensorEntity>> streamAllSensors()
 {
    return sensorReadingRepository.streamAllSensors();
  }
}
