

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerContainer extends StatelessWidget {
  const HomeShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 327/137,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstants.noImage
                  ),fit: BoxFit.cover)
              ),),
          ),
          SpaceWidget(height: 8,),
          Shimmer.fromColors(
              baseColor: AppColors.white,
              highlightColor: AppColors.cD1D8E0,
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          ImageConstants.loadingImage
                      ),fit: BoxFit.fill)
              ),
            )
          ),
          SpaceWidget(height: 5,),
          Shimmer.fromColors(
              baseColor: AppColors.white,
              highlightColor: AppColors.cD1D8E0,
              child: Container(
                height: 25.h,
                width: MediaQuery.sizeOf(context).width*.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            ImageConstants.loadingImage
                        ),fit: BoxFit.fill)
                ),
              )
          ),
          SpaceWidget(height: 14,),
          Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ImageConstants.loadingImage
                          ),fit: BoxFit.fill)
                    ),
                  ),
                ),
              ),
              SpaceWidget(width: 24,),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                ImageConstants.loadingImage
                            ),fit: BoxFit.fill)
                    ),
                  ),
                ),
              ),
              SpaceWidget(width: 24,),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                ImageConstants.loadingImage
                            ),fit: BoxFit.fill)
                    ),
                  ),
                ),
              ),
            ],
          )




        ],
      ),
    );
  }
}
