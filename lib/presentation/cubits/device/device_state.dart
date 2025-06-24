import '../../../domain/entities/device_entity.dart';

abstract class DeviceState {}

class DeviceInitial extends DeviceState {}

class DeviceLoading extends DeviceState {}

class DeviceLoaded extends DeviceState {
  final List<DeviceEntity> devices;
  final Set<String> loadingDeviceIds;

  DeviceLoaded(this.devices, {this.loadingDeviceIds = const {}});
}

class DeviceError extends DeviceState {
  final String message;

  DeviceError(this.message);
}
