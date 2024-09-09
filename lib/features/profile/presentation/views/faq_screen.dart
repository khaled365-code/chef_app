

import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/profile/presentation/cubits/faq_cubit/faq_cubit.dart';
import 'package:chef_app/features/profile/presentation/widgets/faq/famous_question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/faq/faq_app_bar.dart';
import '../widgets/faq/faq_famous_list_view.dart';
import '../widgets/faq/faq_search_field.dart';
import '../widgets/faq/opend_container.dart';
import '../widgets/faq/top_questions_row.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: CustomScrollView(
            slivers:
            [
             SliverToBoxAdapter(
               child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 24.w),
                 child: Column(
                   children: [
                     SpaceWidget(height: 24,),
                     FaqScreenAppBar(),
                     SpaceWidget(height: 31),
                     Text('How can we help you?',style: AppTextStyles.bold20(context).copyWith(
                       color: AppColors.c1E1E2E
                     ),),
                     SpaceWidget(height: 25,),
                     FaqSearchField(),
                     SpaceWidget(height: 30,),
                     FaqFamousListView(),
                     SpaceWidget(height: 31,),
                     TopQuestionsRow(),
                     SpaceWidget(height: 18,),
                     ListView.separated(
                       shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context, index) => OpenedContainer(),
                         separatorBuilder: (context, index) => SpaceWidget(height: 16,),
                         itemCount: 10),
                     SpaceWidget( height: 31),

                   ]
                 ),
               ),
             ),
              // SliverFillRemaining(
              //   child: Column(
              //     children: [
              //       Expanded(
              //         child: ListView.separated(
              //           padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              //             physics: NeverScrollableScrollPhysics(),
              //             itemBuilder: (context, index) => OpenedContainer(),
              //             separatorBuilder: (context, index) => SpaceWidget(height: 16,),
              //             itemCount: 10),
              //       ),
              //
              //     ],
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: SpaceWidget( height: 31),
              // )

            ],
          )),
    );
  }
}

