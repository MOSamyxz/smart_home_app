
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_home_app/data/models/device_model.dart';
import 'package:smart_home_app/domain/entities/device_entity.dart';

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

Stream<List<DeviceEntity>> streamMergedDevices() {
  return Rx.combineLatest2(
    _db.onValue,
    _dbCommand.onValue,
    (DatabaseEvent devicesSnapshot, DatabaseEvent commandsSnapshot) {
      final devicesData = devicesSnapshot.snapshot.value;
      final commandsData = commandsSnapshot.snapshot.value;

      if (devicesData is Map && commandsData is Map) {
        final devicesRaw = Map<String, dynamic>.from(devicesData);
        final commandsRaw = Map<String, dynamic>.from(commandsData);

        return devicesRaw.entries.map((entry) {
          final id = entry.key;
          final deviceMap = Map<String, dynamic>.from(entry.value);
          final commandState = commandsRaw[id];

          return DeviceEntity(
            type: deviceMap['type'] ?? '',
            location: deviceMap['location'] ?? '',
            isActive: commandState ?? false, // نقرأ الحالة من deviceCommand
          );
        }).toList();
      }

      return <DeviceEntity>[];
    },
  );
}

  Future<void> updateDevice(bool isActive , String device) async {
    await _dbCommand.update({
      device: isActive,
    });
  }
}
