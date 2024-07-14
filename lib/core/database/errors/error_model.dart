


import 'package:flutter/foundation.dart';

import '../api/api_keys.dart';
import '../api/end_points.dart';

class ErrorModel
{
  final int statusCode;
  final String errorMessage;
  // final List<String> specificError;

  ErrorModel({required this.statusCode, required this.errorMessage});

  factory ErrorModel.fromjson(json)
  {
     return ErrorModel(
         statusCode: json[ApiKeys.status],
         // specificError: json[ApiKeys.Error] != null ? json[ApiKeys.Error].cast<String>() : [],
         errorMessage: json[ApiKeys.ErrorMessage]);

  }

}