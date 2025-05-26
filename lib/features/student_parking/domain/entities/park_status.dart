enum ParkStatus {
  parked,
  exited;

  static ParkStatus fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'in':
        return ParkStatus.parked;
      case 'out':
        return ParkStatus.exited;
      default:
        return ParkStatus.exited;
    }
  }

  String get value {
    switch (this) {
      case ParkStatus.parked:
        return 'in';
      case ParkStatus.exited:
        return 'out';
    }
  }

  @override
  String toString() => value;
}
