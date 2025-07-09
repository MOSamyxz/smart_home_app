
import '../entities/device_entity.dart';

abstract class DeviceRepository {
  Stream<List<DeviceEntity>> streamAllDevices();
  Future<void> updateDevice(bool isActive, String device);
}
