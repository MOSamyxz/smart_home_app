import 'package:smart_home_app/domain/entities/sensor_entity.dart';

class SensorModel extends SensorEntity{

  SensorModel({
    required super.id,
    required super.timestamp,
    required super.eventType,
    required super.severity,
    required super.sensorType,
    required super.name,
    required super.value,
    required super.unit,
    required super.location,
  });

  factory SensorModel.fromMap(Map<String, dynamic> map, String id) {
    return SensorModel(
      id: id,
      timestamp: DateTime.tryParse((map['time'].toString())) ?? DateTime.now(),
      eventType: map['eventType'] ?? '',
      severity: map['severity'] ?? '',
      sensorType: map['sensorType'] ?? '',
      name: map['name'] ?? '',
      value: (map['value'] ?? 0).toDouble(),
      unit: map['unit'] ?? '',
      location: map['location'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': timestamp.toIso8601String(),
      'eventType': eventType,
      'severity': severity,
      'sensorType': sensorType,
      'name': name,
      'value': value,
      'unit': unit,
      'location': location,
    };
  }
}
