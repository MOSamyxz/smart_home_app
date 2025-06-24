
import '../entities/device_entity.dart';

abstract class DeviceRepository {
  Future<List<DeviceEntity>> getAllDevices();
  Future<void> addDevice(DeviceEntity  device);
  Future<void> updateDevice(DeviceEntity  device, bool isActive);
}
