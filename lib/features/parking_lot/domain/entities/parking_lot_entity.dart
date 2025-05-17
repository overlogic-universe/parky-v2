class ParkingLotEntity {
  final String id;
  final String? name;
  final int? vehichleInCount;
  final int? maxCapacity;
  final double? latitude;
  final double? longitude;
  final bool? isActive;
  final String? inactiveDescription;

  const ParkingLotEntity({
    required this.id,
    this.name,
    this.vehichleInCount,
    this.maxCapacity,
    this.latitude,
    this.longitude,
    this.isActive,
    this.inactiveDescription,
  });

  ParkingLotEntity copyWith({
    String? id,
    String? name,
    int? vehichleInCount,
    int? maxCapacity,
    double? latitude,
    double? longitude,
    bool? isActive,
    String? inactiveDescription,
  }) {
    return ParkingLotEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      vehichleInCount: vehichleInCount ?? this.vehichleInCount,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isActive: isActive ?? this.isActive,
      inactiveDescription: inactiveDescription ?? this.inactiveDescription,
    );
  }
}
