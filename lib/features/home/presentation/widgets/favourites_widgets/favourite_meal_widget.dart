

import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';

class FavouriteMealWidget extends StatelessWidget {
  const FavouriteMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
         Text('category',style: AppTextStyles.regular14(context).copyWith(
           color: AppColors.c181C2E
         ),),
         SpaceWidget(height: 32,),
         Container(
           height: 60.h,
           child:  Row(
             children: [
               Container(
                 width: 60.w,
                 height: 60.h,
                 decoration: BoxDecoration(
                     color: AppColors.primaryColor,
                     borderRadius: BorderRadius.circular(8.r),
                     image: DecorationImage(image: AssetImage(ImageConstants.fishImage),fit: BoxFit.fill)
                 ),
               ),
               SpaceWidget(width: 14,),
               Padding(
                 padding:  EdgeInsets.only(top: 8.h),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:
                   [
                     Text('beef',style: AppTextStyles.bold14(context).copyWith(
                         color: AppColors.c181C2E
                     ),),
                     SpaceWidget(height: 3.h,),
                     Text('\$40.15',style: AppTextStyles.bold14(context).copyWith(
                         color: AppColors.c181C2E
                     ),),
                   ],
                 ),
               )
             ],
           ),
         ),
          SpaceWidget(height: 24,),
          Row(
            children:
            [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(38.h),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)
                  )
                ),
                  onPressed: (){},
                  child: Text('Add to history',style: AppTextStyles.bold12(context).copyWith(
                    color: AppColors.white
                  ),))),
              SpaceWidget(width: 49,),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromHeight(38.h),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(color: AppColors.primaryColor)
                          )
                      ),
                      onPressed: (){},
                      child: Text('Remove',style: AppTextStyles.bold12(context).copyWith(
                          color: AppColors.cFF7622
                      ),)))

            ],
          )
        ],
      ),
    );
  }
}
