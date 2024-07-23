


import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../widgets/account_settings_container.dart';
import '../widgets/general_settings_container.dart';

class MainSettingsScreen extends StatelessWidget {
  const MainSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.cF3F3F3,
      body:SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceWidget(height: 24,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 45.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.cECF0F4
                              ),
                              child: Center(child: SvgPicture.asset(
                                  ImageConstants.arrowBackIcon)),
                            ),
                          ),
                          SpaceWidget(width: 16,),
                          Text(
                            'Settings', style: AppTextStyles.regular17(
                              context).copyWith(color: AppColors.c181C2E),),
                        ],
                      ),
                      SpaceWidget(height: 24,),
                      GeneralSettingsContainer(),
                      SpaceWidget(height: 10,),
                      AccountSettingsContainer(),
                      SpaceWidget(height: 24,),





                    ],
                  ),
                ),
              )
            ],
          ))

    );
  }
}
