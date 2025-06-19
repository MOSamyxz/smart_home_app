import 'package:smart_home_app/data/models/device_model.dart';
import 'package:smart_home_app/presentation/cubits/device/device_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/device_repository.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final DeviceRepository repository;

  DeviceCubit(this.repository) : super(DeviceInitial());

  Future<void> loadDevices() async {
    emit(DeviceLoading());
    try {
      final devices = await repository.getAllDevices();
      emit(DeviceLoaded(devices));
    } catch (e) {
      emit(DeviceError(e.toString()));
    }
  }

  Future<void> addDevice(DeviceModel  device) async {
    try {
      await repository.addDevice(device);
      await loadDevices(); // refresh
    } catch (e) {
      emit(DeviceError(e.toString()));
    }
  }
}
