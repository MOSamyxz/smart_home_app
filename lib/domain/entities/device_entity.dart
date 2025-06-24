class DeviceEntity {
  final String id;
  final String type;
  final String location;
  final bool isActive;

  DeviceEntity({
    required this.id,
    required this.type,
    required this.location,
    required this.isActive,
  });

  DeviceEntity copyWith({
  String? id,
  String? type,
  String? location,
  bool? isActive,
}) {
  return DeviceEntity(
    id: id ?? this.id,
    type: type ?? this.type,
    location: location ?? this.location,
    isActive: isActive ?? this.isActive,
  );
}

}
