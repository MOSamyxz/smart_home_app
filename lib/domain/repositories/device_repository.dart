
import '../entities/device_entity.dart';

abstract class DeviceRepository {
  Future<List<DeviceEntity>> getAllDevices();
  Stream<List<DeviceEntity>> streamAllDevices();
  Future<void> addDevice(DeviceEntity  device);
  Future<void> updateDevice(DeviceEntity  device, bool isActive);
}
