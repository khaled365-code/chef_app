


import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';
import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class NoMealsYet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children:
      [
        Padding(
          padding: EdgeInsets.only(left: 55,right:70,top: 100),
          child: Image.asset(AppAssets.shopCart),
        ),
        Padding(
          padding:EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(S.of(context).nomealsyet,style: AppTextStyles.font24.copyWith(color: AppColors.black)),
              SizedBox(height: 15,),
              Text(S.of(context).hitorangebutton,style: AppTextStyles.font16.copyWith(color: AppColors.grey)),
              Text(S.of(context).belowaddmeal,style: AppTextStyles.font16.copyWith(color: AppColors.grey)),

            ],
          ),
        ),
      ],
    );
  }
}
