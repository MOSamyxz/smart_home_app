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
    return models.map((e) => DeviceEntity(
      id: e.id,
      type: e.type,
      location: e.location,
      isActive: e.isActive,
    )).toList();
  }

  @override
  Future<void> addDevice(DeviceModel device) async {
    await datasource.addDevice(device);
    
  }
}
