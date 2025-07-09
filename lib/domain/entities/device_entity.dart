class DeviceEntity {
  final String type;
  final String location;
  final bool isActive;

  DeviceEntity({
    required this.type,
    required this.location,
    required this.isActive,
  });

  DeviceEntity copyWith({
  String? type,
  String? location,
  bool? isActive,
}) {
  return DeviceEntity(
    type: type ?? this.type,
    location: location ?? this.location,
    isActive: isActive ?? this.isActive,
  );
}

}
