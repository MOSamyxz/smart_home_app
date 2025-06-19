class SensorEntity {
  final String id;
  final DateTime  timestamp;
  final String eventType;
  final String severity;
  final String sensorType;
  final String name;
  final double value;
  final String unit;
  final String location;

  SensorEntity({
    required this.id,
    required this.timestamp,
    required this.eventType,
    required this.severity,
    required this.sensorType,
    required this.name,
    required this.value,
    required this.unit,
    required this.location,
  });
}
