






import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/commons.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/shared_image.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.primary,
        body:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(
                      left: isArabic()?0:31,
                      right: isArabic() ?31:0,
                      top: 15),
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 36.5,
                    child: Image(
                      image: AssetImage(AppAssets.hat),
                      width: 45.86.w,
                      height: 49.65.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(
                      left: isArabic()?0:31,
                      right: isArabic()?15:0),
                  child: ReusedImage(
                    path: AppAssets.foodForEveryone,
                    width: 200,
                    height: 100,),),
                SizedBox(
                  height: 50,
                ),
                Stack(children: [
                  // Background Image
                  Padding(
                    padding: const EdgeInsets.only(top: 85,left: 185),
                    child: Align(
                      child: Transform.rotate(
                          angle: .01,
                          child: ReusedImage(
                            path: AppAssets.toyFace1,
                            width: 200,
                            height: 300,
                            boxFit:BoxFit.cover ),
                      alignment: Alignment.centerRight,
                    ),
                  )),
                  // foreground image
                  Align(
                    child: Transform.rotate(
                      angle: -.01,
                      child:ReusedImage(
                        path: AppAssets.toyFace2,
                        width: 287,
                        height: 400,
                          boxFit:BoxFit.cover)),
                    alignment: Alignment.centerLeft,
                  ),
                ]),
              Padding(
                padding:  EdgeInsets.only(left: 45, right: 29, top: 15),
                child: SharedButton(
                    width: 300,
                    height: 60,
                    borderRadius: BorderRadius.circular(30),
                    text: S.of(context).getstarted,
                    textStyle: AppTextStyles.font16,
                    textcolor: AppColors.red,
                    buttonColor: AppColors.white,
                    onPressed: ()
                    {
                      CacheHelper().getData(key: ApiKeys.token)==null? navigate(context: context, route: Routes.changeLanguageScreen):navigate(context: context, route: Routes.homeScreen);

                    }),
              ),
            ],
            ),
      ),
    );
  }
}