



import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception
{
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleExceptions(DioException e)
{
  switch (e.type)
  {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
          errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(
          errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(
          errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(
          errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode)
      {
        case 401:
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));

        case 403:
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));

        case 404:
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));

        case 409:
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));

        case 422:
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));


        case 504:
          throw ServerException(
              errorModel: ErrorModel.fromjson(e.response!.data));
      }
    case DioExceptionType.cancel:
      throw ServerException(
          errorModel: ErrorModel(statusCode: 500,errorMessage: e.toString()));
    case DioExceptionType.connectionError:
      throw ServerException(
          errorModel: ErrorModel.fromjson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(
          errorModel: ErrorModel(statusCode: 500,errorMessage: e.toString()));
  }
}
