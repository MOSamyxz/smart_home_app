import 'package:smart_home_app/domain/entities/sensor_reading_entity.dart';

class SensorReadingModel extends SensorReadingEntity {

  SensorReadingModel({

    required super.value,
    required super.timestamp,
  });

  factory SensorReadingModel.fromMap(Map<String, dynamic> map) {
    return SensorReadingModel(
      value: map['value'] != null ? (map['value'] as num).toDouble() : 0.0,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['time']) ,
    );
  }


}