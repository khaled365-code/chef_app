




import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'header_body_item.dart';

class SettingsContainer extends StatelessWidget {



  final IconData icon1;
  final IconData icon2;
  final IconData? icon3;
  final  String text1;
  final  String text2;
  final  String? text3;
  final double? height;
  final void Function() onTap1;
  final void Function() onTap2;
  final void Function()? onTap3;


  const SettingsContainer({super.key, required this.icon1, required this.icon2, this.icon3, required this.text1, required this.text2, this.text3, this.height=130, required this.onTap1, required this.onTap2,  this.onTap3});



  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 24),
     child: Container(
       width: 342,
       height: height,
       decoration: BoxDecoration(
         color: AppColors.grey2,
         borderRadius: BorderRadius.circular(16)

       ),
       child: Padding(
         padding: const EdgeInsets.only(left: 13,top: 15),
         child: Column(
           children: [
             HeaderBodyItem(icon:icon1,text: text1,onTap: onTap1,sizedBoxWidth: 40,iconColor: AppColors.black,textColor: AppColors.grey,),
             SizedBox(height: 15,),
             HeaderBodyItem(icon: icon2,text: text2,onTap: onTap2,sizedBoxWidth: 40,iconColor: AppColors.black,textColor: AppColors.grey),
             SizedBox(height: 15,),
             icon3!=null ? HeaderBodyItem(icon: icon3!,text: text3!,onTap: onTap3!,sizedBoxWidth: 40,iconColor: AppColors.black,textColor: AppColors.grey):SizedBox(),
           ],
         ),
       ),
     ),
   );
  }
}
