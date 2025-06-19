
class DeviceModel {
  final String id;
  final String type;
  final String location;
  final bool isActive;

  DeviceModel({
    required this.id,
    required this.type,
    required this.location,
    required this.isActive,
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
}
