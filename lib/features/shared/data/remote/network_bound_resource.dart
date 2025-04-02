// import '../../../../core/failures/exception.dart';
// import 'network_info.dart';
// import '../../../../core/utils/resource_state.dart';

// abstract class NetworkBoundResource<ResultType, RequestType> {
//   final NetworkInfo networkInfo;

//   NetworkBoundResource(this.networkInfo);

//   Future<ResourceState<ResultType>> fetchData() async {
//     try {
//       // Ambil data dari database terlebih dahulu
//       ResultType? dbSource = await loadFromDB();
//       if (shouldFetch(dbSource)) {
//         // Cek koneksi internet sebelum memanggil API
//         final RequestType apiResponse = await networkInfo.safeNetworkRequest(
//           result: createCall,
//         );

//         // Simpan hasil API ke database
//         await saveCallResult(apiResponse);

//         // Ambil data terbaru dari database
//         dbSource = await loadFromDB();
//       }

//       return ResourceState.success(dbSource as ResultType);
//     } on CommonException {
//       if()
//       return ResourceState.error("No internet connection.");
//     } catch (e) {
//       return ResourceState.error(e.toString());
//     }
//   }

//   Future<ResultType?> loadFromDB();
//   bool shouldFetch(ResultType? data);
//   Future<RequestType> createCall();
//   Future<void> saveCallResult(RequestType data);
// }
