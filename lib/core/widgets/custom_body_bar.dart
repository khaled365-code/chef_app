



import 'package:flutter/material.dart';

import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';

class CustomBodyBar extends StatelessWidget {

  final double? bodyBarHeight;
  const CustomBodyBar({
    super.key, this.bodyBarHeight=200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bodyBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              children:
              [
                Image.asset(AppAssets.authelipsis2),
                Image.asset(AppAssets.authelipsis3),
                Padding(
                    padding: const EdgeInsets.only(top: 35, left: 20),
                    child:  GestureDetector(
                      onTap: ()
                      {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8)

                          ),
                          child: Icon(Icons.arrow_back_ios_outlined)),
                    )),
              ]),
          Spacer(),
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppAssets.authelipsis1)),
        ],
      ),
    );
  }
}