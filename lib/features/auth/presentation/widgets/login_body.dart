

import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_outline_text_field.dart';
import 'package:chef_app/features/auth/presentation/widgets/remember_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';
import 'dont_have_account_widget.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.context});

  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final loginCubit=BlocProvider.of<LoginCubit>(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height*579/812,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsetsDirectional.only(start: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              SizedBox(height: 24.h,),
              Text('Email',style: AppTextStyles.regular13(context).copyWith(color: Color(0xff32343E)),),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsetsDirectional.only(end: 24.w),
                child: CustomOutlineTextField(
                  hintText: 'example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 24.h,),
              Text('Password',style: AppTextStyles.regular13(context).copyWith(color: Color(0xff32343E)),),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsetsDirectional.only(end: 24.w),
                child: CustomOutlineTextField(
                  hintText: '* * * * * * * * * *',
                  keyboardType: TextInputType.text,
                  suffixIcon: GestureDetector(
                    onTap: ()
                      {
        
                        loginCubit.changeEyeShape();
                      },
                      child: Icon(loginCubit.suffixIcon,color: AppColors.cB4B9CA,)),
                ),
              ),
              SizedBox(height: 24.h,),
              Padding(
                padding:  EdgeInsetsDirectional.only(end: 24.w),
                child: RememberMeWidget(),
              ),
              SizedBox(height: 31.h,),
              Padding(
                padding:  EdgeInsetsDirectional.only(end: 24.w),
                child: SharedButton(
                  btnText: 'Log In',
                  onPressessed: ()
                  {
        
                  },
                ),
              ),
              SizedBox(height: 38.h,),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 38.w),
                child: DontHaveAccountWidget(),
              )
        
        
        
        
        
        
        
        
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
