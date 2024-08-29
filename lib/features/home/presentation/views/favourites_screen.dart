




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding:  EdgeInsetsDirectional.only(start: 10.w),
            child: GestureDetector(
              onTap: ()
              {
                Navigator.pop(context);
              },
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cECF0F4
                ),
                child: Center(child: SvgPicture.asset(
                  ImageConstants.arrowBackIcon,width: 10,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),)),
              ),
            ),
          ),
          title: Text('My Favourites',style: AppTextStyles.regular17(context).copyWith(
              color: AppColors.c181C2E
          ),),
          bottom: TabBar(
            unselectedLabelStyle: AppTextStyles.regular14(context).copyWith(
              color: AppColors.cA5A7B9
            ),
            labelStyle: AppTextStyles.bold14(context).copyWith(
              color: AppColors.cFF7622
            ),
              indicatorColor: AppColors.cFF7622,
               indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsetsDirectional.only(start: 24.w,),
              dividerColor: AppColors.cCED7DF,

              tabs:
              [
                Tab(
                  child: Text('Ongoing',style: AppTextStyles.bold14(context),),
                ),
                Tab(
                  child: Text('History',style: AppTextStyles.bold14(context),),
                )
              ]),
        ),
        body: Container(
          child: TabBarView(
              children:
              [
                Center(child:Text('Ongoing')),
                Center(child:Text('History')),
              ]),
        ),
      ),
    );
  }
}



