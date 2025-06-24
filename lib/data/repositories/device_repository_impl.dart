import 'package:smart_home_app/data/datasources/firebase_device_datasource.dart';
import '../../domain/entities/device_entity.dart';
import '../../domain/repositories/device_repository.dart';
import '../models/device_model.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final FirebaseDeviceDatasource datasource;

  DeviceRepositoryImpl(this.datasource);

  @override
  Future<List<DeviceEntity>> getAllDevices() async {
    final models = await datasource.getAllDevices();
    return models
        .map(
          (e) => DeviceEntity(
            id: e.id,
            type: e.type,
            location: e.location,
            isActive: e.isActive,
          ),
        )
        .toList();
  }

  @override
  Future<void> addDevice(DeviceEntity device) async {
    final model = DeviceModel.fromEntity(device);
    await datasource.addDevice(model);
  }

  @override
  Future<void> updateDevice(DeviceEntity device, bool isActive) async {
    final model = DeviceModel.fromEntity(device);
    await datasource.updateDevice(model, isActive);
  }
}
