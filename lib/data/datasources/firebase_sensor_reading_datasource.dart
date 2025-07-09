import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:smart_home_app/data/models/sensor_reading_model.dart';

class FirebaseSensorReadingDatasource {

Future<List<SensorReadingModel>> getSensorReadings(String sensorType) async {
  final db = FirebaseDatabase.instance.ref('sensors/$sensorType');
  final snapshot = await db.get();

  if (!snapshot.exists || snapshot.value == null) return [];

  try {
    final data = snapshot.value;

    if (data is Map) {
      final rawData = Map<String, dynamic>.from(data);

      final readings = rawData.entries.map((e) {
        return SensorReadingModel.fromMap(Map<String, dynamic>.from(e.value));
      }).toList();

      // ✅ ترتيبهم حسب التاريخ
      readings.sort((a, b) => a.timestamp.compareTo(b.timestamp));

      return readings;
    } else {
      throw Exception('Unexpected data format');
    }
  } catch (e) {
    log('Error loading sensors: $e');
    return [];
  }
}


}