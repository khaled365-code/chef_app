


import 'package:flutter/material.dart';

import '../../../../../core/widgets/space_widget.dart';
import '../../cubits/faq_cubit/faq_cubit.dart';
import 'opend_container.dart';

class FaqQuestionsListView extends StatelessWidget {
  const FaqQuestionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => OpenedContainer(
          questionsAndAnswersModel: FaqCubit.get(context).questionsAndAnswersList[index],
        ),
        separatorBuilder: (context, index) => SpaceWidget(height: 16,),
        itemCount: FaqCubit.get(context).questionsAndAnswersList.length);
  }
}
