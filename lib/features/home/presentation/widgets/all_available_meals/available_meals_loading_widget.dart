

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            child: GridView.builder(
              itemBuilder: (context, index) => GridShimmerMealItem(),
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 21.h,
                  crossAxisSpacing: 21.w,
                  mainAxisExtent: 200.h
              ),
            ),
          ),
        ],
      ),
    );
  }
}
