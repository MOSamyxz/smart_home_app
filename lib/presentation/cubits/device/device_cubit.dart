import 'package:smart_home_app/data/models/device_model.dart';
import 'package:smart_home_app/domain/entities/device_entity.dart';
import 'package:smart_home_app/presentation/cubits/device/device_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/device_repository.dart';
class DeviceCubit extends Cubit<DeviceState> {
  final DeviceRepository repository;

  DeviceCubit(this.repository) : super(DeviceInitial());

  List<DeviceEntity> _devices = [];

  Future<void> loadDevices() async {
    emit(DeviceLoading());
    try {
      _devices = await repository.getAllDevices();
      emit(DeviceLoaded(_devices));
    } catch (e) {
      emit(DeviceError(e.toString()));
    }
  }

  Future<void> addDevice(DeviceEntity device) async {
    try {
      await repository.addDevice(DeviceModel.fromEntity(device));
      _devices.add(device);
      emit(DeviceLoaded(List.from(_devices)));
    } catch (e) {
      emit(DeviceError(e.toString()));
    }
  }

  Future<void> updateDevice(DeviceEntity device, bool isActive) async {
    if (state is! DeviceLoaded) return;

    final currentState = state as DeviceLoaded;
    final updatedLoadingIds = Set<String>.from(currentState.loadingDeviceIds)..add(device.id);
    emit(DeviceLoaded(List.from(_devices), loadingDeviceIds: updatedLoadingIds));

    try {
      await repository.updateDevice(DeviceModel.fromEntity(device), isActive);
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index] = device.copyWith(isActive: isActive);
      }
    } catch (e) {
      emit(DeviceError(e.toString()));
      return;
    }

    final afterUpdateLoadingIds = Set<String>.from(updatedLoadingIds)..remove(device.id);
    emit(DeviceLoaded(List.from(_devices), loadingDeviceIds: afterUpdateLoadingIds));
  }
}
