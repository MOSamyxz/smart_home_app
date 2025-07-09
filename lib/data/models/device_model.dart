
import 'package:smart_home_app/domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {


  DeviceModel({
    required super.type,
    required super.location,
    required super.isActive,
  });

  factory DeviceModel.fromMap(Map<String, dynamic> map, String docId) {
    return DeviceModel(
      type: map['type'] ?? '',
      location: map['location'] ?? '',
      isActive: map['state'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'location': location,
      'state': isActive,
    };
  }

  factory DeviceModel.fromEntity(DeviceEntity entity) {
    return DeviceModel(
      type: entity.type,
      location: entity.location,
      isActive: entity.isActive,
    );
  }
}
