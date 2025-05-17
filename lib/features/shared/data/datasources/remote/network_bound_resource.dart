import 'dart:developer';

import '../../../../../core/utils/resource_state.dart';
import 'network_info.dart';

class NetworkBoundResource<ResultType, RequestType> {
  final NetworkInfo networkInfo;
  final Future<ResultType?> Function() loadFromDB;
  final bool Function(ResultType? data) shouldFetch;
  final Future<RequestType> Function() createCall;
  final Future<void> Function(RequestType data) saveCallResult;

  NetworkBoundResource({
    required this.networkInfo,
    required this.loadFromDB,
    required this.shouldFetch,
    required this.createCall,
    required this.saveCallResult,
  });

  Future<ResourceState<ResultType>> fetchData() async {
    try {
      ResultType? dbSource = await loadFromDB();
      if (shouldFetch(dbSource)) {
        final RequestType apiResponse = await networkInfo.safeNetworkRequest(
          result: createCall,
        );

        log("API RESPONE ${apiResponse}");

        await saveCallResult(apiResponse);
        dbSource = await loadFromDB();
      }

      return ResourceState.success(dbSource as ResultType);
    } catch (_) {
      rethrow;
    }
  }
}
