class ParkingLotEntity {
  final String id;
  final String name;
  final int vehichleInCount;
  final int maxCapacity;
  final double? latitude;
  final double? longitude;
  final bool isActive;
  final String? inActiveDescription;

  const ParkingLotEntity({
    required this.id,
    required this.name,
    required this.vehichleInCount,
    required this.maxCapacity,
    this.latitude,
    this.longitude,
    required this.isActive,
    this.inActiveDescription,
  });
}
