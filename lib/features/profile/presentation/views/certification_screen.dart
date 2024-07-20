

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/utilis/fontweight_helper.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceWidget(height: 24,),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 24.w),
                child: GestureDetector(
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
              ),
              Spacer(),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w),
                child: Center(
                  child: AspectRatio(
                      aspectRatio: 228/207,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(32.r),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            CacheHelper().getData(key: ApiKeys.healthCertificate),
                          ),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                ),
              ),
              SpaceWidget(height: 32.15,),
              Center(
                child: Text('certification!',style: AppTextStyles.extraBold24(context).copyWith(
                  color: AppColors.c111A2C,
                  fontWeight: FontweightHelper.bold
                ),),
              ),
              SpaceWidget(height: 16,),
              Center(
                child: Text('Here is your health certificate',style: AppTextStyles.regular14(context).copyWith(
                    color: AppColors.c111A2C,
                ),),
              ),
              Center(
                child: Text('enjoy our service!',style: AppTextStyles.regular14(context).copyWith(
                    color: AppColors.c525C67,
                ),),
              ),
              Spacer(),


            ],
          )),
    );
  }
}
