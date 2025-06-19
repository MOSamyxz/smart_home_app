import 'package:smart_home_app/data/models/device_model.dart';

import '../entities/device_entity.dart';

abstract class DeviceRepository {
  Future<List<DeviceEntity>> getAllDevices();
  Future<void> addDevice(DeviceModel device);
}
