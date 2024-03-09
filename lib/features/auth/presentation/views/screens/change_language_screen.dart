







import 'package:chef_app/core/widgets/custom_body_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global_cubits/change_language_cubit/change_language_cubit.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/commons.dart';
import '../../../../../core/widgets/outlined_text_field.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/shared_image.dart';
import '../../../../../generated/l10n.dart';

class ChangeLanguageScreen extends StatefulWidget {

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {

  late String desiredCode;
  List <String>languagesList=['english','arabic'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBodyBar(
            bodyBarHeight: 100,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(S
                        .of(context)
                        .language, style: AppTextStyles.font32.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(S.of(context).pleasechooselanguage,
                        style: AppTextStyles.font16.copyWith(
                            color: AppColors.grey)),
                    Text(S.of(context).youwantforthisapp,
                        style: AppTextStyles.font16.copyWith(
                            color: AppColors.grey)),
                    SizedBox(height: 50,),
                  ])),
                    Center(
                      child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
                      builder: (context, state) {
                      return Column(
                        children: [
                          SharedButton(
                            text: S.of(context).english,
                            textStyle: AppTextStyles.font24,
                            borderRadius: BorderRadius.circular(16),
                            textcolor: AppColors.white,
                            buttonColor: AppColors.primary,
                            width: 300,
                            height: 50,
                            onPressed: ()
                            {
                              desiredCode='en';
                              setState(() {

                              });
                              BlocProvider.of<ChangeLanguageCubit>(context).desiredCode=desiredCode;
                              BlocProvider.of<ChangeLanguageCubit>(context).changeLang();
                              navigate(context: context, route: Routes.loginScreen);

                            },
                            border: Border.all(
                              color: AppColors.white,
                              width: 2

                            ),
                          ),
                          SizedBox(height: 20,),
                          SharedButton(
                            text: S.of(context).arabic,
                            textStyle: AppTextStyles.font24,
                            borderRadius: BorderRadius.circular(16),
                            textcolor: AppColors.white,
                            buttonColor: AppColors.primary,
                            width: 300,
                            height: 50,
                            onPressed: ()
                            {
                              desiredCode='ar';
                              setState(() {

                              });
                              BlocProvider.of<ChangeLanguageCubit>(context).desiredCode=desiredCode;
                              BlocProvider.of<ChangeLanguageCubit>(context).changeLang();
                              navigate(context: context, route: Routes.loginScreen);
                            },
                            border: Border.all(
                                color: AppColors.white,
                                width: 2

                            ),

                          )
                        ],
                      );
                                        },
                                      ),
                    ),

              ],
            ),
      ));
  }
}
