import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:chef_app/features/profile/presentation/cubits/get_chef_data_cubit/get_chef_data_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/drawer_header_widget.dart';
import '../widgets/logout_and_delete_account_container.dart';
import '../widgets/meals_and_notifications_container.dart';
import '../widgets/personal_and_edit_profile_container.dart';
import '../widgets/settings_and_faq_container.dart';


class CustomDrawerScreen extends StatelessWidget {
  const CustomDrawerScreen({super.key, required this.homeContext});

  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
              child:
              CustomScrollView(slivers:
              [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 24.w, end: 24.w),
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
                            Text('Profile', style: AppTextStyles.regular17(
                                context).copyWith(color: Color(0xff181C2E)),),
                            Spacer(),
                            GestureDetector(
                              onTap: ()
                              {
                                print(CacheHelper().getData(key: ApiKeys.phone));
                              },
                              child: Container(
                                width: 45.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.cECF0F4
                                ),
                                child: Center(child: SvgPicture.asset(
                                    ImageConstants.points3Icon)),
                              ),
                            ),
                          ],
                        ),
                        SpaceWidget(height: 24,),
                        DrawerHeaderWidget(),
                        SpaceWidget(height: 32,),
                        PersonalAndEditProfileBodyContainer(

                        ),
                        SpaceWidget(height: 20,),
                        MealsAndNotificationsContainer(),
                        SpaceWidget(height: 20,),
                        SettingsAndFaqContainer(),
                        SpaceWidget(height: 20,),
                        LogoutAndDeleteAccountContainer(),
                        SpaceWidget(height: 24,),

                      ],
                    ),
                  ),
                ),


              ])),
        );
  }
}










