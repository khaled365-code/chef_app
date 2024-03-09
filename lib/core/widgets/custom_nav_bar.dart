




import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';


class CustomNavBar extends StatefulWidget {

  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final void Function()? onPressed3;
  final void Function()? onPressed4;
  final void Function()? onPressed5;

  final IconData? iconn1;
  final IconData? iconn2;
  final IconData? iconn3;
  final IconData? iconn4;
  final IconData? iconn5;
  int nowIndex;







   CustomNavBar({super.key, this.onPressed1, this.onPressed2, this.onPressed3, this.onPressed4, this.iconn1, this.iconn2, this.iconn3, this.iconn4, this.iconn5, this.onPressed5, required this.nowIndex});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context)
  {



    return Container(
     width: double.infinity,
     height: 80,
     child: BottomNavigationBar(
       backgroundColor:AppColors.white,
       selectedLabelStyle: AppTextStyles.font12,
       unselectedLabelStyle: AppTextStyles.font12,
       currentIndex: widget.nowIndex,
       selectedItemColor: AppColors.primary,
       selectedIconTheme: IconThemeData(color: AppColors.primary),
       unselectedItemColor: AppColors.homeColor,
       unselectedIconTheme: IconThemeData(color: AppColors.homeColor),
       showUnselectedLabels: true,
       items:
       [

         BottomNavigationBarItem(icon: IconButton( onPressed: widget.onPressed1,icon: Icon(widget.iconn1,size: 30,)),label: 'Home',),
         BottomNavigationBarItem(icon: IconButton( onPressed: widget.onPressed2,icon: Icon(widget.iconn2,size: 30,)),label: 'Location'),
         BottomNavigationBarItem(icon: IconButton( onPressed: widget.onPressed3,icon:Icon(widget.iconn3,size: 30,)),label: 'Alarm'),
         BottomNavigationBarItem(icon: IconButton( onPressed: widget.onPressed4,icon:Icon(widget.iconn4,size: 30,)),label: 'Profile'),
         BottomNavigationBarItem(icon: IconButton( onPressed: widget.onPressed5,icon:Icon(widget.iconn5,size: 30,)),label: 'Meals'),



       ],
     ),
   );}
}
