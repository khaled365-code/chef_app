

import 'package:chef_app/core/database/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiHelper
{

  final dio=Dio();
  Future<dynamic> get({required String endPoint}) async
  {
    var response=await dio.get('${EndPoints.baseUrl}$endPoint');
    Map<String,dynamic> data=response.data;

    List<dynamic> result=[];


  }



}