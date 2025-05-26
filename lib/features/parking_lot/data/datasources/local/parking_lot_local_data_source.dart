import '../../models/parking_lot_model.dart';
import '../../models/parking_assignment.dart';

abstract class ParkingLotLocalDataSource {
  Future<List<ParkingLotModel>> getParkingLotListByParkingAssignmentId(
    List<ParkingAssignmentModel> parkingAssignmentList,
  );
  Future<void> saveParkingLotModelList(List<ParkingLotModel>? models);
}
