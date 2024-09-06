import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/core/widgets/shared_loading_indicator.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:chef_app/features/profile/presentation/cubits/logout_cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/injection/injector.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LogoutCubit(
              profileRepoImplementation: locator.get<
                  ProfileRepoImplementation>()),
      child: BlocListener<LogoutCubit,LogoutState>(
        listener: (context, state)
        {
          handleLogoutListener(state, context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 34.24.w,
                height: 35.h,
                decoration: BoxDecoration(
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
              height: MediaQuery.sizeOf(context).height * (316 / 812),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset(ImageConstants.logouAccountLottie2),
                  Text('Do you want to logout?',
                    style: AppTextStyles.bold20(context)
                        .copyWith(color: AppColors.c181C2E),),
                  SpaceWidget(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: FittedBox(
                      child: Text(
                        'You can login with the same email address later',
                        style: AppTextStyles.bold18(context).copyWith(
                            color: AppColors.cA4ACAD
                        ),),
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<LogoutCubit,LogoutState>(
                    builder: (context,state){
                      if (state is LogoutLoadingState)
                        {
                          return Center(child: SharedLoadingIndicator(),);
                        }
                      else
                        {
                          return SharedButton(
                            onPressed: ()
                            {
                              LogoutCubit.get(context).logoutFun();
                            },
                            btnText: 'Confirm',
                            btnTextStyle: AppTextStyles.bold16(context).copyWith(
                                color: AppColors.white),);
                        }
                    },
                  ),
                  SpaceWidget(height: 15,),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Text(
                        'Cancel', style: AppTextStyles.bold16(context).copyWith(
                        color: AppColors.primaryColor)),
                  ),
                  Spacer()


                ],
              ),
            )

          ],
        ),
      ),);
  }

  void handleLogoutListener(LogoutState state, BuildContext context) {
    if (state is LogoutSuccessState) {
      CacheHelper().removeData(key: ApiKeys.token);
      Future.delayed(Duration(seconds: 2));
      navigate(context: context, route: Routes.loginScreen);
    }
    if (state is LogoutFailureState) {
      if (state.errorModel.error != null) {
        showToast(msg: state.errorModel.error.toString().substring(
            1, state.errorModel.error
            .toString()
            .length - 1), toastStates: ToastStates.error);
      }
      else {
        showToast(msg: state.errorModel.errorMessage!,
            toastStates: ToastStates.error);
      }
    }
  }
}
