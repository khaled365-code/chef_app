


import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/features/home/presentation/viewmodels/delete_account_cubit/delete_account_cubit.dart';
import 'package:chef_app/features/home/presentation/viewmodels/logout_cubit/logout_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/two_choices_alert_dialog.dart';
import '../../../../../generated/l10n.dart';
import 'header_body_item.dart';

class HomeDrawerBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 300,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 24,top: 30),
          child: Column(
            children:
            [
             HeaderBodyItem(icon: Icons.person_4_outlined, text: S.of(context).editProfile,
               onTap: ()
               {
                 navigate(context: context, route: Routes.updateProfileScreen);
               },
             ),
              SizedBox(height: 35,),
              HeaderBodyItem(icon: Icons.visibility_off_outlined, text: S.of(context).password,
                onTap: ()
                {
                  navigate(context: context, route: Routes.changePasswordScreen);
                },
              ),
              SizedBox(height: 35,),
              HeaderBodyItem(icon: Icons.settings, text: S.of(context).settings,
                onTap: ()
                {
                  navigate(context: context, route: Routes.settingsScreen);
                },),
              SizedBox(height: 35,),
              HeaderBodyItem(icon: Icons.language, text: S.of(context).language,
                onTap: ()
                {
                  showDialog(
                      context: context,
                      builder: (context) => TwoChoicesAlertDialog(
                        titleText: S.of(context).language,
                        choice1Text: S.of(context).english,
                        choice2Text: S.of(context).arabic,
                        onPressedChoice1: (){
                          BlocProvider.of<ChangeLanguageCubit>(context).desiredCode='en';
                          BlocProvider.of<ChangeLanguageCubit>(context).changeLang();
                          Navigator.pop(context);
                        },
                        onPressedChoice2: (){
                          BlocProvider.of<ChangeLanguageCubit>(context).desiredCode='ar';
                          BlocProvider.of<ChangeLanguageCubit>(context).changeLang();
                          Navigator.pop(context);


                        },
                      ));
                },),
              SizedBox(height: 35,),
              HeaderBodyItem(icon: Icons.logout, text: S.of(context).logout,
                onTap: ()
                  {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                          confirmPressed: () async
                          {
                            BlocProvider.of<LogoutCubit>(context).logout();
                          },
                          subTitle: S.of(context).logoutsure));
                },),
              SizedBox(height: 35,),
              HeaderBodyItem(icon: Icons.delete_outline_outlined, text: S.of(context).deleteaccount,
                onTap: ()
                {
                  showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                          confirmPressed: ()
                          {
                            BlocProvider.of<DeleteAccountCubit>(context).deleteAccount();
                          },
                          subTitle: S.of(context).areyousure));
                },),


            ],
          ),
        ),
      ),
    );
  }
}


