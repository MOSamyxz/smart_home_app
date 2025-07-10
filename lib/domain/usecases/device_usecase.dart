import 'package:smart_home_app/domain/entities/device_entity.dart';
import 'package:smart_home_app/domain/repositories/device_repository.dart';

class DeviceUsecase {
  final DeviceRepository deviceRepository;

  DeviceUsecase(this.deviceRepository);

  Future<void> updateDeviceStatus(DeviceEntity device, bool isActive) async {
     deviceRepository.updateDevice( isActive , device.type);
  }

  Stream<List<DeviceEntity>> streamAllDevices() {
    return deviceRepository.streamAllDevices();
  }

}