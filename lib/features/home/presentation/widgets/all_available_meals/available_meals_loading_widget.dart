

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'grid_shimmer_meal_item.dart';

class AllAvailableMealsLoadingWidget extends StatelessWidget {
  const AllAvailableMealsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 21.h,
                crossAxisSpacing: 21.w,
                clipBehavior: Clip.none,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GridShimmerMealItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
