class ParkingLotEntity {
  final String id;
  final String name;
  final int maxCapacity;
  final double? latitude;
  final double? longitude;
  final bool isActive;
  final String? inactiveDescription;
  final int vehicleInCount; // ← ditambahkan
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ParkingLotEntity({
    required this.id,
    required this.name,
    required this.maxCapacity,
    this.latitude,
    this.longitude,
    required this.isActive,
    this.inactiveDescription,
    required this.vehicleInCount, // ← wajib
    this.createdAt,
    this.updatedAt,
  });

  ParkingLotEntity copyWith({
    String? id,
    String? name,
    int? maxCapacity,
    double? latitude,
    double? longitude,
    bool? isActive,
    String? inactiveDescription,
    int? vehicleInCount, // ← ditambahkan
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ParkingLotEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isActive: isActive ?? this.isActive,
      inactiveDescription: inactiveDescription ?? this.inactiveDescription,
      vehicleInCount: vehicleInCount ?? this.vehicleInCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
