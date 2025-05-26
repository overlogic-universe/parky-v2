import '../../models/parking_lot_model.dart';
import '../../models/parking_assignment.dart';

abstract class ParkingLotRemoteDataSource {
  Future<List<ParkingLotModel>> getParkingLotListByParkingAssignmentId(
    List<ParkingAssignmentModel> parkingAssignmentList,
  );
}
