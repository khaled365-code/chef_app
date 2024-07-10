
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/splash_and_onbording/data/models/onboarding_data_model.dart';
import 'package:chef_app/features/splash_and_onbording/presentation/widgets/page_view_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/dot_container_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


  List<OnboardingDataModel>onboardingDataModelList =
  [
    OnboardingDataModel(image: ImageConstants.onboardingImage1, title: 'All your favorites', subtitle: 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'),
    OnboardingDataModel(image: ImageConstants.onboardingImage2, title: 'Order from choosen chef', subtitle: 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'),
    OnboardingDataModel(image: ImageConstants.onboardingImage3, title: 'Free delivery offers', subtitle: 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'),

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*(114/812),),
            Expanded(
              child: PageView.builder(
                clipBehavior: Clip.none,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                  itemCount: onboardingDataModelList.length,
                  itemBuilder: (context, index) => PageViewContent(
                    onboardingDataModel: onboardingDataModelList[index],
                  ),),
            ),
            SizedBox(height: 32.h,),
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
            SizedBox(height: 69.h,),
            SharedButton(btnText: currentIndex!=2?'Next':'Get Started'),
            currentIndex!=2?SizedBox(height: 16,):SizedBox.shrink(),
            currentIndex!=2? Text('Skip',style: AppTextStyles.regular16(context).copyWith(color: Color(0xff646982)),):SizedBox.shrink(),
            currentIndex!=2? SizedBox(height: 40,):SizedBox(height: 75,),


          ],
        ),
      ),
    );
  }
}
