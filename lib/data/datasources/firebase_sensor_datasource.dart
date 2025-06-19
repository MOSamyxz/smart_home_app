import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import '../models/sensor_model.dart';

class FirebaseSensorDatasource {
  final _db = FirebaseDatabase.instance.ref('sensors');

Future<List<SensorModel>> getAllSensors() async {
  final snapshot = await _db.get();

  if (!snapshot.exists || snapshot.value == null) return [];
  try {
    final data = snapshot.value;
    if (data is Map) {
      final rawData = Map<String, dynamic>.from(data);
      return rawData.entries.map((e) {
        return SensorModel.fromMap(Map<String, dynamic>.from(e.value), e.key);
      }).toList();
    } else {
      throw Exception('Unexpected data format');
    }
  } catch (e) {
    log('Error loading sensors: $e');
    return [];
  }
}


  Future<void> addSensor(SensorModel sensor) async {
    await _db.child(sensor.id).set(sensor.toMap());
  }
}
