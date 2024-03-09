






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
                        image: DecorationImage(image: AssetImage(AppAssets.welcomephoto),fit: BoxFit.fill)
                    ),),
                    Positioned(
                      top: 630,
                      left: 30,
                      right: 30,
                      child: SharedButton(
                          width: 315,
                          height: 54,
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
                    ),


                  ],
                )


            ),
      ),
    );
  }
}