


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
import '../widgets/personal_info/personal_info_bar.dart';
import '../widgets/personal_info/personal_info_container.dart';
import '../widgets/personal_info/personal_info_container2.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF3F3F3,
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
                    PersonalInfoAppBar(),
                    SpaceWidget(height: 24,),
                    DrawerHeaderWidget(),
                    SpaceWidget(height: 32,),
                    PersonalInfoContainer(),
                    SpaceWidget(height: 20,),
                    PersonalInfoContainer2(),
                    SpaceWidget(height: 29,),

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

