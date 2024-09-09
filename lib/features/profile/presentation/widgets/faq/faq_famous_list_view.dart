

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/space_widget.dart';
import '../../cubits/faq_cubit/faq_cubit.dart';
import 'famous_question_item.dart';

class FaqFamousListView extends StatelessWidget {
  const FaqFamousListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => FamousQuestionItem(
            famousQuestionsModel: FaqCubit.get(context).famousQuestions[index]),
        separatorBuilder: (context, index) => SpaceWidget(width: 16,),
        itemCount: FaqCubit.get(context).famousQuestions.length,),
    );
  }
}
