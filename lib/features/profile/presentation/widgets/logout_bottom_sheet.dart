


import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:chef_app/features/profile/presentation/cubits/logout_cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/injection/injector.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LogoutCubit(
      profileRepoImplementation: locator.get<ProfileRepoImplementation>()),
  child: BlocConsumer<LogoutCubit, LogoutState>(
  listener: (context, state)
  {
    if(state is LogoutSuccessState)
      {
        CacheHelper().removeData(key: ApiKeys.token);
        Future.delayed(Duration(seconds: 2));
        navigate(context: context, route: Routes.loginScreen);
      }
    if(state is LogoutFailureState)
      {
        if(state.errorModel.error!=null)
        {
          showToast(msg: state.errorModel.error.toString().substring(1,state.errorModel.error.toString().length-1), toastStates: ToastStates.error);
        }
        else
        {
          showToast(msg: state.errorModel.errorMessage!, toastStates: ToastStates.error);
        }
      }
   },
  builder: (context, state) {
    var logoutCubit = BlocProvider.of<LogoutCubit>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 34.2.w,
            height: 35.h,
            decoration:BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Center(
              child: SvgPicture.asset(ImageConstants.closeIcon),
            ),
          ),
        ),
        SpaceWidget(height: 10,),
        Container(
          height: MediaQuery.sizeOf(context).height*(261/812),
          width: MediaQuery.sizeOf(context).width,
          color: AppColors.white,
          child: Column(
            children: [
              SpaceWidget(height: 20,),
              Text('Do you want to logout?',
                style: AppTextStyles.bold20(context)
                    .copyWith(color: AppColors.c181C2E),),
              SpaceWidget(height: 10,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 35.w),
                child: FittedBox(
                  child: Text('You can login with the same email address later',style: AppTextStyles.bold18(context).copyWith(
                    color: AppColors.cA4A5AE
                  ),),
                ),
              ),
              Spacer(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children:
                  [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                                side: BorderSide(color: AppColors.c88828D),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(AppColors.white),
                            elevation: WidgetStatePropertyAll(0),
                            fixedSize: WidgetStatePropertyAll(Size(0,50.h)),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text('Cancel',style: AppTextStyles.bold16(context).copyWith(
                              color: AppColors.c1E1E2E))),
                    ),
                    SpaceWidget(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
                          elevation: WidgetStatePropertyAll(0),
                          fixedSize: WidgetStatePropertyAll(Size(0,50.h)),
                        ),
                          onPressed: ()
                          {

                            logoutCubit.logoutFun();
                          },
                          child: Text('Logout',style: AppTextStyles.bold16(context).copyWith(
                          color: AppColors.white))),
                    ),


                  ],
                ),
              ),
              SpaceWidget(height: 30,),


            ],
          ),
        )


      ],
    );
  },
),
);
  }
}
