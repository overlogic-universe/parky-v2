class ExceptionHandler {
  const ExceptionHandler._();

  // TODO: Handle exception 

  // static Exception dioExceptionHandle(DioException e, StackTrace stacktrace) {
  //   try {
  //     if (e.error is SocketException) {
  //       return OfflineException();
  //     } else if (e.response == null) {
  //       return UnexpectedException();
  //     } else {
  //       switch (e.response!.statusCode) {
  //         case 401:
  //           {
  //             return LoginException();
  //           }
  //         case 500:
  //           {
  //             return ServerException();
  //           }
  //         default:
  //           {
  //             return UnexpectedException();
  //           }
  //       }
  //     }
  //   } catch (e) {
  //     return UnexpectedException();
  //   }
  // }

  // static Exception dioStatusCodeExceptionHandle(int? statusCode) {
  //   switch (statusCode) {
  //     case 401:
  //       {
  //         return LoginException();
  //       }
  //     case 500:
  //       {
  //         return ServerException();
  //       }
  //     default:
  //       {
  //         return LoginException();
  //       }
  //   }
  // }
}
