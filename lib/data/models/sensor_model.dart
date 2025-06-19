class SensorModel {
  final String id;
  final DateTime  timestamp;
  final String eventType;
  final String severity;
  final String sensorType;
  final String name;
  final double value;
  final String unit;
  final String location;

  SensorModel({
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

  factory SensorModel.fromMap(Map<String, dynamic> map, String id) {
    return SensorModel(
      id: id,
      timestamp: DateTime.tryParse(map['timestamp'] ?? '') ?? DateTime.now(),
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
      'timestamp': timestamp.toIso8601String(),
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
