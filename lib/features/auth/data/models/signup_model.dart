

import 'package:chef_app/core/database/api/end_points.dart';

class SignUpModel
{
  final String message;
  SignUpModel({required this.message});

  factory SignUpModel.fromjson(json)
  {
    return SignUpModel(message: json[ApiKeys.message]);
  }


}