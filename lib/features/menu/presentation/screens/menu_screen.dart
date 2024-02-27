

import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/food_container.dart';
import 'package:chef_app/core/widgets/no_meals_widget.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../generated/l10n.dart';

class MenueScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: AppColors.grey2,
         body: CustomScrollView(
           shrinkWrap: true,
         slivers:
         [
           SliverToBoxAdapter(child:Padding(
             padding: const EdgeInsets.only(top: 35,left: 15),
             child: Center(
               child: Text(
                 'Found 6 results',
                 style: AppTextStyles.font32.copyWith(color: AppColors.black),
               ),
             ),
           )),
           SliverToBoxAdapter(child: SizedBox(height: 80)),
           /*SliverGrid(
               delegate: SliverChildBuilderDelegate((context, index) => Padding(
                 padding: const EdgeInsets.only(left: 15),
                 child: FoodContainer
                   (
                   text1: 'Veggie',
                   text2: ' tomato mix',
                   price: 'N1,900',
                   imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.5LaZe00TcACoG2-1pA8BQAHaHg&pid=Api&P=0&h=220',
                   width: 158,
                   textLeft: 25,
                   textBottom: 45,
                   imageTop: -30,
                   imageLeft: 40,
                   onTap: ()
                   {
                     showDialog(context: context, builder: (context) => CustomAlertDialog(
                       message: S.of(context).deletemeal,
                       confirmPressed: ()
                       {

                       },

                     ),);

                   },
                 ),
               ),),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 90,crossAxisSpacing: 5,)),*/
           SliverToBoxAdapter(child: NoMealsYet())

         ],
       ),
       floatingActionButton: Padding(
         padding: const EdgeInsets.only(bottom:10,right: 10),
         child: GestureDetector(onTap: (){
           navigate(context: context, route: Routes.addMealScreen);
         },child: CircleAvatar(backgroundColor: AppColors.orange,radius: 30, child: Icon(Icons.add))),
       ),
     
     ),
   );
  }
}

