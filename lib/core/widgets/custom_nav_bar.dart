




import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';


class CustomNavBar extends StatelessWidget {

  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final void Function()? onPressed3;
  final void Function()? onPressed4;
  final IconData? iconn1;
  final IconData? iconn2;
  final IconData? iconn3;
  final IconData? iconn4;

  const CustomNavBar({super.key, this.onPressed1, this.onPressed2, this.onPressed3, this.onPressed4, this.iconn1, this.iconn2, this.iconn3, this.iconn4});


  @override
  Widget build(BuildContext context)
  {



    return Container(
     width: double.infinity,
     height: 80,
     decoration: BoxDecoration(
       color: AppColors.grey2,
     ),
     child: Padding(
       padding: const EdgeInsets.only(left: 25,right: 20,bottom: 5),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           IconButton(
               onPressed: onPressed1,
               icon: Icon(iconn1,color: AppColors.primary,size: 30,)),
           IconButton(
               onPressed: onPressed2,
               icon: Icon(iconn2,color: AppColors.primary,size: 30,)),
           IconButton(
               onPressed: onPressed3,
               icon: Icon(iconn3,color: AppColors.primary,size: 30,)),
           IconButton(
           onPressed: onPressed4,
           icon: Icon(iconn4, color: AppColors.primary,size: 30,)),
         ]
       ),
     ),
   );}
}
