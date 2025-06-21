import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailuer extends Failure {
  ServerFailuer({required super.errorMessage});

  factory ServerFailuer.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer(errorMessage: 'Connection Timeout With ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailuer(errorMessage: 'Send Failure With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailuer(errorMessage: 'Recive Failure With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailuer(
            errorMessage: 'Certification Failure With ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailuer(errorMessage: 'Request to ApiServer Was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailuer(errorMessage: 'Connection Failure With ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailuer(errorMessage: 'No Internet Connection.');
        }
        return ServerFailuer(
            errorMessage: 'Unexpected Error, Please Try agin Later!');
    }
  }

  factory ServerFailuer.fromResponse(int statuescode, dynamic response) {
    if (statuescode == 400 || statuescode == 401 || statuescode == 403) {
      final errorMessage = response['message'] ?? 'Unknown error';
      return ServerFailuer(errorMessage: errorMessage);
    } else if (statuescode == 404) {
      return ServerFailuer(
          errorMessage: 'Your Request Not Found, Please Try agin Later!');
    } else if (statuescode == 500) {
      return ServerFailuer(
          errorMessage: 'Internal server Error, Please Try agin Later!');
    } else {
      return ServerFailuer(
          errorMessage: 'Oops There Was an Error, Try again Later.');
    }
  }
}
