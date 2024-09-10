


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class EditProfileRowSettings extends StatelessWidget {
  const EditProfileRowSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: CacheHelper().getData(key: ApiKeys.profilePic)!=null?
              DecorationImage(
                  image: CachedNetworkImageProvider(
                      CacheHelper().getData(key: ApiKeys.profilePic)
                  ), fit: BoxFit.fill):
              DecorationImage(
                  image: AssetImage(ImageConstants.userDefaultImage),
                  fit: BoxFit.fill)

          ),
        ),
        SpaceWidget(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(CacheHelper().getData(key: ApiKeys.name),
              style: AppTextStyles.bold14(context).copyWith(
                  color: AppColors.c32343E),),
            SpaceWidget(height: 1,),
            Text('Edit your profile',
              style: AppTextStyles.regular14(context).copyWith(
                  color: AppColors.c6B6E82),),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: ()
          {
            navigate(context: context, route: Routes.editProfileScreen);
          },
          child: Container(
              width: 60.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25.r)
              ),
              child: Center(
                child: Text(
                  'Edit',
                  style: AppTextStyles.regular14(context).copyWith(
                      color: AppColors.white
                  ),
                ),
              )),
        )
      ],
    );
  }
}
