import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/api/dio_consumer.dart';
import '../../../../../core/database/api/end_points.dart';
import '../../../../../core/database/errors/server_exception.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());
  final DioConsumer api;
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  bool passwordHide=true;
  IconData suffixIcon=Icons.visibility_off;
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  LoginModel? user;

  signIn() async
  {
    try
    {
      emit(LoginLoadingState());

      final response = await api.post(EndPoint.signIn, data: {
        ApiKeys.email=emailController.text,
        ApiKeys.password=passwordController.text
      });
      user=LoginModel.fromjson(response);
      final decodedToken=JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKeys.token, value: user!.token);
      CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      emit(LoginSuccessState());
    } on ServerException catch(e)
    {
      emit(LoginFailureState(
        errorMessage: e.errorModel.errorMessage
      ));
    }



  }
  void changePasswordEye()
  {
    suffixIcon=passwordHide?Icons.visibility:Icons.visibility_off;
    passwordHide=!passwordHide;
    emit(ChangeLoginEyeState());

  }

}
