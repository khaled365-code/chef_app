import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/injection/injector.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/get_meals_model/meals.dart';
import '../../cubits/home_screen_cubit/home_screen_cubit.dart';

class AddMealToFavouritesOptionsButtons extends StatelessWidget {
  const AddMealToFavouritesOptionsButtons({
    super.key,
    required this.meal,
  });

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel', style: AppTextStyles.bold16(context).copyWith(
                color: AppColors.c32343E
            ),),),
        ),
        SpaceWidget(width: 10,),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () async
              {
                Navigator.pop(context);
                navigate(context: context, route: Routes.favouritesScreen);
              },
              child: Text(
                'Yes',
                style: AppTextStyles.bold18(context).copyWith(
                    color: AppColors
                        .white),
              )),
        ),
      ],
    );
  }
}
