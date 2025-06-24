
import 'package:smart_home_app/domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {


  DeviceModel({
    required super.id,
    required super.type,
    required super.location,
    required super.isActive,
  });

  factory DeviceModel.fromMap(Map<String, dynamic> map, String docId) {
    return DeviceModel(
      id: docId,
      type: map['type'] ?? '',
      location: map['location'] ?? '',
      isActive: map['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'location': location,
      'isActive': isActive,
    };
  }

  factory DeviceModel.fromEntity(DeviceEntity entity) {
    return DeviceModel(
      id: entity.id,
      type: entity.type,
      location: entity.location,
      isActive: entity.isActive,
    );
  }
}
