



import 'package:chef_app/core/database/errors/new_error_model.dart';
import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception
{
  final NewErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleExceptions(DioException e)
{
  switch (e.type)
  {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
          errorModel: NewErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(
          errorModel: NewErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(
          errorModel: NewErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(
          errorModel: NewErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode)
      {
        case 400:
          throw ServerException(
              errorModel: NewErrorModel.fromJson(e.response!.data));
        case 401:
          throw ServerException(
              errorModel: NewErrorModel.fromJson(e.response!.data));

        case 403:
          throw ServerException(
              errorModel: NewErrorModel.fromJson(e.response!.data));

        case 404:
          throw ServerException(
              errorModel: NewErrorModel.fromJson(e.response!.data));

        case 409:
          throw ServerException(
              errorModel: NewErrorModel.fromJson(e.response!.data));

        case 422:
          throw ServerException(
              errorModel: NewErrorModel.fromJson(e.response!.data));


        case 504:
          throw ServerException(
              errorModel: NewErrorModel.fromJson(e.response!.data));
      }
    case DioExceptionType.cancel:
      throw ServerException(
          errorModel:NewErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(
          errorModel: NewErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(
          errorModel:NewErrorModel.fromJson(e.response!.data));
  }
}
