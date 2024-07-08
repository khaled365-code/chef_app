






import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/shared_image.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';

class StartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
              child :Stack(
                  children:
                  [
                    Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imageConstants.desiredStartBackgroundImage),fit: BoxFit.fill)
                    ),),
                    Column(
                      children:
                      [
                        Spacer(),
                        Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 49.h),
                          child: Column(
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: ()
                                  {
                                    CacheHelper().getData(key: ApiKeys.token)==null? navigate(context: context, route: Routes.changeLanguageScreen):navigate(context: context, route: Routes.homeScreen);

                                  },
                                  child: Container(
                                    width: 315.w,
                                    height: 54.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white.withOpacity(.2),
                                      border:  Border.all(
                                          color: AppColors.white,
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(25),),
                                    child: Center(child: Text(S.of(context).getstarted,style: AppTextStyles.font24.copyWith(color: AppColors.white),)),
                                  ),
                                ),
                              ),
                              SizedBox(height:25.h),
                              Padding(
                                padding: EdgeInsetsDirectional.only(start: 85.w,end: 85.w),
                                child: Row(
                                  children: [
                                    Text('Already have an account?',
                                      style: AppTextStyles.font17.
                                      copyWith(color: AppColors.white,fontWeight: FontWeight.normal),),
                                    SizedBox(width: 5.w,),
                                    GestureDetector(
                                      onTap: ()
                                      {
                                        navigate(context: context, route: Routes.loginScreen);
                                      },
                                      child: Text('Sign In',
                                        style: AppTextStyles.font17.
                                        copyWith(color: AppColors.white,fontWeight: FontWeight.normal),),
                                    ),
                                  ],
                                ),

                              )
                            ],
                          ),
                        ),

                      ],
                    )

                  ],
                )


            ),
      ),

    );
  }


}

/*
SharedButton(
                              width: 315.w,
                              height: 54.h,
                              border:  Border.all(
                                  color: AppColors.white,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(25),
                              text: S.of(context).getstarted,
                              textStyle: AppTextStyles.font24,
                              textcolor: AppColors.white,
                              buttonColor: AppColors.white.withOpacity(.2),
                              onPressed: ()
                              {
                                CacheHelper().getData(key: ApiKeys.token)==null? navigate(context: context, route: Routes.changeLanguageScreen):navigate(context: context, route: Routes.homeScreen);

                              }),




 */