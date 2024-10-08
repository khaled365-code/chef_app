
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/splash_and_onbording/data/models/onboarding_data_model.dart';
import 'package:chef_app/features/splash_and_onbording/presentation/widgets/page_view_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';
import '../widgets/dot_container_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


  List<OnboardingDataModel>onboardingDataModelList =
  [
    OnboardingDataModel(image: ImageConstants.onboardingImage1, title: 'All your favorites', subtitle: 'Get all your loved foods in one once place,\nyou just place the meal we do the rest'),
    OnboardingDataModel(image: ImageConstants.onboardingImage2, title: 'Meal from choosen chef', subtitle: 'Get all your loved foods in one once place,\nyou just place the meal we do the rest'),
    OnboardingDataModel(image: ImageConstants.onboardingImage3, title: 'Free delivery offers', subtitle: 'Get all your loved foods in one once place,\nyou just place the meal we do the rest'),

  ];

  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState()
  {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex=pageController.page!.toInt();
      });
    },);
    super.initState();
  }
  @override
  void dispose()
  {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*(114/812),),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                  itemCount: onboardingDataModelList.length,
                  itemBuilder: (context, index) => PageViewContent(
                    onboardingDataModel: onboardingDataModelList[index],
                  ),),
            ),
            SpaceWidget(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsetsDirectional.only(end: 12.w),
                  child: DotContainerItem(
                    isActive: index == currentIndex,
                  ),
                ),
              ),
            ),
            SpaceWidget(height: 69.h,),
            SharedButton(btnText: currentIndex!=2?'Next':'Get Started',
              onPressed: ()
              {
                if(currentIndex!=2)
                  {
                    pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
                  }
                else
                  {
                    navigate(context: context, route: Routes.loginScreen,replacement: true);
                  }
              },
            ),
            SizedBox(height: 16,),
            currentIndex!=2? GestureDetector(
              onTap: ()
                {
                  navigate(context: context, route: Routes.loginScreen,replacement: true);
                },
                child: Text('Skip',style: AppTextStyles.regular16(context).copyWith(color: Color(0xff646982)),)):SizedBox.shrink(),
            currentIndex!=2? SizedBox(height: 40,):SizedBox(height: 59,),


          ],
        ),
      ),
    );
  }
}
