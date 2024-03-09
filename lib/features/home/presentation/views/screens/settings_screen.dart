


import 'package:chef_app/core/utilis/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../generated/l10n.dart';
import '../../viewmodels/logout_cubit/logout_cubit.dart';
import '../components/settings_container.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
    appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(S.of(context).settings,style: AppTextStyles.font24.copyWith(color: AppColors.black,)),
        centerTitle: true
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Text('Account',style: AppTextStyles.font24.copyWith(color: AppColors.black,)),
          ),
          SizedBox(height: 10,),
          SettingsContainer(
            onTap1: ()
            {

            },
            onTap2: ()
            {

            }, onTap3: ()
            {
              navigate(context: context, route: Routes.privacyScreen);
            },
            icon1: Icons.security_outlined,
            text1: 'Security',
            icon2: Icons.notifications_none_outlined,
            text2: 'Notifications',
            icon3: Icons.privacy_tip_outlined,
            text3: 'Privacy and Policy',

          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Text('Support & About',style: AppTextStyles.font24.copyWith(color: AppColors.black,)),
          ),
          SizedBox(height: 10,),
          SettingsContainer(
            onTap1: ()
            {

            },
            onTap2: ()
            {

            }, onTap3: ()
          {
            navigate(context: context, route: Routes.faqScreen);
          },
            icon1: Icons.wallet_travel_outlined,
            text1: 'My Subscribtion',
            icon2: Icons.help_outline_outlined,
            text2: 'Help & Support',
            icon3: Icons.question_mark,
            text3: 'Faq',

          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Text('Cache & cellular',style: AppTextStyles.font24.copyWith(color: AppColors.black,)),
          ),
          SizedBox(height: 10,),
          SettingsContainer(
            onTap1: ()
            {

            },
            onTap2: ()
            {

            },
            height: 100,
            icon1: Icons.delete_outline_outlined,
            text1: 'Free up space',
            icon2: Icons.data_exploration_outlined,
            text2: 'Data Saver',

          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Text('Actions',style: AppTextStyles.font24.copyWith(color: AppColors.black,)),
          ),
          SizedBox(height: 10,),
          SettingsContainer(
            onTap1: ()
            {

            },
            onTap2: ()
            {

            }, onTap3: ()
          {
            showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                    confirmPressed: () async
                    {
                      BlocProvider.of<LogoutCubit>(context).logout();
                    },
                    subTitle: S.of(context).logoutsure));
            },
            icon1: Icons.flag_outlined,
            text1: 'Report a problem',
            icon2: Icons.supervisor_account_outlined,
            text2: 'Add account',
            icon3: Icons.logout_outlined,
            text3: 'Log out',

          )
        ],
      ),

    );
  }
}