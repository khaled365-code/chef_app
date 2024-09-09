


import 'package:chef_app/core/commons/global_models/local_notifications_model.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notificationModel});

  final LocalNotificationsModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          Container(
            width: 54.w,
            height: 54.h,
            decoration: notificationModel.image!=null?
            BoxDecoration(
              image: DecorationImage(image: AssetImage(notificationModel.image!)),
              shape: BoxShape.circle,
              color: AppColors.c98A8B8
            ):
            BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.c98A8B8
            ),
          ),
          SpaceWidget(width: 14,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(notificationModel.title,style: AppTextStyles.regular13(context).copyWith(color: AppColors.c32343E,))),
              SpaceWidget(height: 5,),
              Text(notificationModel.body,style: AppTextStyles.regular13(context).copyWith(color: AppColors.c9C9BA6,)),
              SpaceWidget(height: 10,),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: formatDate(dateTime: DateTime.parse(notificationModel.notificationTime),monthName: true).toString(),style: AppTextStyles.regular12(context).copyWith(color: AppColors.c9C9BA6,)
                  ),
                  TextSpan(text: ' at ${formatClock(DateTime.parse(notificationModel.notificationTime))}',style: AppTextStyles.regular12(context).copyWith(color: AppColors.c9C9BA6,)),
                  TextSpan(text: ' ${getAmorPm(DateTime.parse(notificationModel.notificationTime))}',style: AppTextStyles.regular12(context).copyWith(color: AppColors.c9C9BA6,))
                ]
              ))

            ],
          )
        ],
      ),

    );
  }

}
