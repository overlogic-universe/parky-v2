class ParkingLotEntity {
  final String id;
  final String name;
  final int vehicleInCount;
  final int maxCapacity;
  final double? latitude;
  final double? longitude;
  final bool isActive;
  final String? inactiveDescription;

  const ParkingLotEntity({
    required this.id,
    required this.name,
    required this.vehicleInCount,
    required this.maxCapacity,
    this.latitude,
    this.longitude,
    required this.isActive,
    this.inactiveDescription,
  });

  ParkingLotEntity copyWith({
    String? id,
    String? name,
    int? vehicleInCount,
    int? maxCapacity,
    double? latitude,
    double? longitude,
    bool? isActive,
    String? inactiveDescription,
  }) {
    return ParkingLotEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      vehicleInCount: vehicleInCount ?? this.vehicleInCount,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isActive: isActive ?? this.isActive,
      inactiveDescription: inactiveDescription ?? this.inactiveDescription,
    );
  }
}
