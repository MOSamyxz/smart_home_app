import 'package:smart_home_app/data/datasources/firebase_device_datasource.dart';
import '../../domain/entities/device_entity.dart';
import '../../domain/repositories/device_repository.dart';
import '../models/device_model.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final FirebaseDeviceDatasource datasource;

  DeviceRepositoryImpl(this.datasource);


@override
Stream<List<DeviceEntity>> streamAllDevices() {
  return datasource.streamAllDevices().map((models) {
    return models.map((e) => DeviceEntity(
      type: e.type,
      location: e.location,
      isActive: e.isActive,
    )).toList();
  });
}



  @override
  Future<void> updateDevice(bool isActive, String device) async {

    await datasource.updateDevice( isActive , device);

  }
}
