


import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/login/remember_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/services/internet_connection_service.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../widgets/login/email_login_field.dart';
import '../widgets/login/password_login_field.dart';
import '../widgets/login/options_for_account_widget.dart';
import '../widgets/auth_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocListener<LoginCubit,LoginState>(
  listener: (context, state)
  {
    handleLoginListener(state, context);
  },
  child: Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AuthHeaderWidget(
              hasBackButton: false,
              title: 'Log In',
              subTitle: 'Please sign in to your existing account',
            ),
            // 579/812
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height*(520/812),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(start: 24.w),
                    child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Form(
                      key: LoginCubit.get(context).loginFormKey,
                      autovalidateMode: LoginCubit.get(context).loginAutoValidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          SpaceWidget(height: 24,),
                          EmailLoginField(),
                          SpaceWidget(height: 24,),
                          LoginPasswordField(),
                          SpaceWidget(height: 24,),
                          Padding(
                            padding:  EdgeInsetsDirectional.only(end: 24.w),
                              child: RememberMeWidget(
                                    isRemembered: LoginCubit.get(context).isAccountRemembered,
                                  )
                            ),
                          SpaceWidget(height: 31,),
                          state is LoginLoadingState?
                          Center(
                            child: SharedLoadingIndicator(),
                          ):
                          Padding(
                            padding:  EdgeInsetsDirectional.only(end: 24.w),
                            child: SharedButton(
                              btnText: 'Log In',
                              onPressed: () async
                              {
                                if(await InternetConnectionCheckingService.checkInternetConnection()==true)
                                {
                                  if(LoginCubit.get(context).loginFormKey.currentState!.validate())
                                  {
                                    LoginCubit.get(context).loginFormKey.currentState!.save();
                                    LoginCubit.get(context).loginFun(
                                        email: LoginCubit.get(context).emailController.text,
                                        password: LoginCubit.get(context).passwordController.text);
                                  }
                                  else
                                  {
                                    LoginCubit.get(context).changeValidateMode();
                                  }
                                }
                                else
                                {
                                  buildScaffoldMessenger(context: context, msg: 'You are offline',iconWidget: Icon(Icons.wifi_off,color: AppColors.white,),snackBarBehavior: SnackBarBehavior.floating);
                                }
                      
                              },
                            ),
                          ),
                          SpaceWidget(height: 38,),
                          OptionsForAccountWidget(
                            title1: 'Don\'t have an account?',
                            title2: ' Sign up',
                            onActionTapped: ()
                            {
                              navigate(context: context, route: Routes.signUpScreen);
                            },
                          )
                        ],
                      ),
                    );
  },
),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
);
  }

  void handleLoginListener(LoginState state, BuildContext context) async
  {
    if(state is LoginFailureState)
      {
        if(state.theError.error!=null)
          {
            buildScaffoldMessenger(context: context, msg: state.theError.error!.toString().substring(1,state.theError.error!.toString().length-1));
          }
        else
          {
            buildScaffoldMessenger(context: context, msg: state.theError.errorMessage!);
          }
      }
    if(state is LoginSuccessState)
      {
        buildScaffoldMessenger(context: context, msg: state.successLoginModel.message);
        await LoginCubit.get(context).rememberMeFun(
            email: LoginCubit.get(context).emailController.text,
            password: LoginCubit.get(context).passwordController.text);
        navigate(context: context, route: Routes.homeScreen,replacement: true);
      }

  }
}


