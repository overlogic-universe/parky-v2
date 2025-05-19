enum ParkStatus {
  parked,
  exited;

  static ParkStatus fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'parked':
        return ParkStatus.parked;
      case 'exited':
        return ParkStatus.exited;
      default:
        return ParkStatus.exited;
    }
  }

  String get value {
    switch (this) {
      case ParkStatus.parked:
        return 'parked';
      case ParkStatus.exited:
        return 'exited';
    }
  }

  @override
  String toString() => value;
}
