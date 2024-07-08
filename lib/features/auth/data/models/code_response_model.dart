

import 'package:chef_app/core/database/api/end_points.dart';

import '../../../../core/database/api/api_keys.dart';

class CodeModel
{
  final String message;

  CodeModel({required this.message});

  factory CodeModel.fromJson(json)
  {
    return CodeModel(message: json[ApiKeys.message]);
  }


}