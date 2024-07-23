

import 'package:chef_app/core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/profile/presentation/widgets/line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageAndThemeCubit, ChangeLanguageAndThemeState>(
  builder: (context, state) {
    var changeLanguageCubit = BlocProvider.of<ChangeLanguageAndThemeCubit>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r)
             ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpaceWidget(height: 10,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w),
                  child: FittedBox(child: Text('Would you like to change the app language to',style: AppTextStyles.bold15(context).copyWith(color: AppColors.cA0A5BA),)),
                ),
                Text('Arabic (AR)?',style: AppTextStyles.bold15(context).copyWith(color: AppColors.cA0A5BA),),
                SpaceWidget(height: 10,),
                LineWidget(
                  height: 3,
                ),
                SpaceWidget(height: 20,),
                GestureDetector(
                   onTap: ()
                    {
                      changeLanguageCubit.changeCurrentAppLanguage(languageCode: 'ar');
                    },
                    child: Text('Change to Arabic (AR)',style: AppTextStyles.bold18(context).copyWith(color: AppColors.primaryColor),)),
                SpaceWidget(height: 20,),
                LineWidget(
                  height: 3,
                ),
                SpaceWidget(height: 20,),
                GestureDetector(
                    onTap: ()
                    {
                      changeLanguageCubit.changeCurrentAppLanguage(languageCode: 'en');
                    },
                    child: Text('Keep English',style: AppTextStyles.bold18(context).copyWith(color: AppColors.primaryColor),)),
                SpaceWidget(height: 20,),







              ],
            ),
          ),
          SpaceWidget(height: 10,),
          SharedButton(
            btnText: 'Cancel',
            onPressessed: ()
            {
              Navigator.pop(context);
            },
            btnColor: WidgetStatePropertyAll(
              AppColors.white
            ),
            borderRadiusValue: 10,
            btnSize: WidgetStatePropertyAll(
              Size(MediaQuery.sizeOf(context).width, 50.h)
            ),
            btnTextStyle: AppTextStyles.bold20(context).copyWith(
              color: AppColors.primaryColor
            ),
          ),
          SpaceWidget(height: 20,),

        ]),
    );
  },
);
  }
}
