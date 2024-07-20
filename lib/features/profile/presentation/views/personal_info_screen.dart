


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/drawer_header_widget.dart';
import '../widgets/personal_info_container.dart';
import '../widgets/personal_info_container2.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers:
          [
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                child: Column(
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
                        Text('Personal Info', style: AppTextStyles.regular17(
                            context).copyWith(color: Color(0xff181C2E)),),
                        Spacer(),
                        Text('Edit', style: AppTextStyles.regular17(context).
                        copyWith(color: AppColors.cFF7622),),
                      ],
                    ),
                    SpaceWidget(height: 24,),
                    DrawerHeaderWidget(),
                    SpaceWidget(height: 32,),
                    PersonalInfoContainer(),
                    SpaceWidget(height: 20,),
                    PersonalInfoContainer2(),
                    SpaceWidget(height: 24,),


                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
