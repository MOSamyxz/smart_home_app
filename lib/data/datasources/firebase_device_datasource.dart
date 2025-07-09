
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_home_app/data/models/device_model.dart';

class FirebaseDeviceDatasource {
  final _db = FirebaseDatabase.instance.ref('devices');
  final _dbCommand = FirebaseDatabase.instance.ref('devicesCommands');

Stream<List<DeviceModel>> streamAllDevices() {
  return _db.onValue.map((event) {
    final data = event.snapshot.value;
    if (data is Map) {
      final rawData = Map<String, dynamic>.from(data);
      return rawData.entries.map((e) {
        return DeviceModel.fromMap(Map<String, dynamic>.from(e.value), e.key);
      }).toList();
    } else {
      return [];
    }
  });
}
  Future<void> updateDevice(bool isActive , String device) async {
    await _dbCommand.update({
      device: isActive,
    });
  }
}
