import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:smart_home_app/data/models/device_model.dart';

class FirebaseDeviceDatasource {
  final _db = FirebaseDatabase.instance.ref('devices');


Future<List<DeviceModel>> getAllDevices() async {
  final snapshot = await _db.get();

  if (!snapshot.exists || snapshot.value == null) return [];
  try {
    final data = snapshot.value;
    if (data is Map) {
      final rawData = Map<String, dynamic>.from(data);
      return rawData.entries.map((e) {
        return DeviceModel.fromMap(Map<String, dynamic>.from(e.value), e.key);
      }).toList();
    } else {
      throw Exception('Unexpected data format');
    }
  } catch (e) {
    log('Error loading sensors: $e');
    return [];
  }
}
  Future<void> addDevice(DeviceModel device) async {
    await _db.child(device.id).set(device.toJson());
  }

  Future<void> updateDevice(DeviceModel device, bool isActive) async {
    await _db.child(device.id).update({
      'isActive': isActive,
    });
  }
}
