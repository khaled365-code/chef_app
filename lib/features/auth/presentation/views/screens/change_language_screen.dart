







import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global_cubits/change_language_cubit/change_language_cubit.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/commons.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/shared_image.dart';
import '../../../../../generated/l10n.dart';

class ChangeLanguageScreen extends StatefulWidget {

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {

  late String desiredCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(top: 100),
              child: Center(
                  child: ReusedImage(
                path: AppAssets.hat,
                width: 100,
                height: 130,
              ))),
          Text(
            S.of(context).welcome,
            style: AppTextStyles.font32,
          ),
          SizedBox(
            height: 54.h,
          ),
          Text(
            S.of(context).chooselanguage,
            style: AppTextStyles.font24.copyWith(color: AppColors.grey),
          ),
          SizedBox(
            height: 100.h,
          ),
          BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
         builder: (context, state) {
         return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SharedButton(
                    text: S.of(context).english,
                    textStyle: AppTextStyles.font24,
                    textcolor: AppColors.white,
                    buttonColor: AppColors.red,
                    width: 140,
                    height: 48,
                    onPressed: ()
                  {
                    desiredCode='en';
                    setState(() {

                    });
                    BlocProvider.of<ChangeLanguageCubit>(context).desiredCode=desiredCode;
                    BlocProvider.of<ChangeLanguageCubit>(context).changeLang();
                    navigate(context: context, route: Routes.loginScreen);

                  },
                ),
                SharedButton(
                    text: S.of(context).arabic,
                    textStyle: AppTextStyles.font24,
                    textcolor: AppColors.white,
                    buttonColor: AppColors.red,
                    width: 140,
                    height: 48,
                    onPressed: ()
                  {
                    desiredCode='ar';
                    setState(() {

                    });
                    BlocProvider.of<ChangeLanguageCubit>(context).desiredCode=desiredCode;
                    BlocProvider.of<ChangeLanguageCubit>(context).changeLang();
                    navigate(context: context, route: Routes.loginScreen);
                  },

                )
              ],
            ),
          );
  },
)
        ],
      )),
    );
  }
}
