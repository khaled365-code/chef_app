




import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/custom_nav_bar.dart';
import 'package:chef_app/core/widgets/outlined_text_field.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/food_container.dart';
import '../../../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.grey2,
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: GestureDetector(child: Image.asset(AppAssets.lines3),onTap: (){}, ),
        ),
        actions:
        [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(icon: Icon(Icons.shopping_cart_outlined,size: 30,color: AppColors.grey),onPressed:(){} ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            SizedBox(height: 10,),
           Text(S.of(context).delicious,style: AppTextStyles.font32.copyWith(color: AppColors.black),),
            Text(S.of(context).foodforyou,style: AppTextStyles.font32.copyWith(color: AppColors.black)),
            SizedBox(height: 28,),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: OutlinedTextField(
                  textInputType: TextInputType.text,
                  hintText: 'search',
                  controller: TextEditingController(),
                  validator: (value)
                  {
                    if(value!.isEmpty)
                      {
                        return S.of(context).please_enter_name;
                      }
                    return null;
                  },
                suffixIcon: Icons.search,
                fillColor: AppColors.white,
                borderRadiusValue: 25,
                top: 35,
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                height: 70,
                width: double.infinity,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>  Container(
                      child: Column(
                        children:
                        [
                          Text('Food',style: AppTextStyles.font16.copyWith(color: AppColors.grey),),
                          SizedBox(height: 10,),
                          SizedBox(width:60,height:10,child: Divider(thickness: 2,color: AppColors.primary,)),

                        ],
                      ),
                    ),
                    separatorBuilder:  (context, index) =>SizedBox(width: 30),
                    itemCount: 10),
              ),
            ),
            SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 20),
              child: Container(
                height: 270,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                   scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FoodContainer(
                      text1: 'Veggie',
                      text2: 'tomato mix',
                      price: '200 LE',
                      imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.5LaZe00TcACoG2-1pA8BQAHaHg&pid=Api&P=0&h=220',
                      imageRadius: 60,
                      textLeft: 60,
                      textBottom: 70,
                      imageTop: -30,
                      imageLeft: 50,
                      minusBottom: 40,
                      minusRight: 20,
                      borderRadiusValue: 40,
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
                    separatorBuilder: (context, index) => SizedBox(width: 34,),
                    itemCount: 10),
              ),
            ),
            
          ],
        ),
      ),
      
      bottomNavigationBar: CustomNavBar(
        iconn1: Icons.home,
        iconn2: Icons.person,
        iconn3: Icons.favorite,
        iconn4: Icons.shopping_cart_outlined,
        onPressed1: ()
        {
          navigate(context: context, route: Routes.homeScreen);
        },
        onPressed2: ()
        {
          navigate(context: context, route: Routes.profileScreen);

        },
        onPressed3: ()
        {

        },
        onPressed4: ()
        {

          navigate(context: context, route: Routes.menuScreen);

        },
      ),

    );
  }
}


