import 'package:bloc/bloc.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/faq_screen_models/famous_qustions_model.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

   static FaqCubit get(context) => BlocProvider.of(context);
  List<FamousQuestionsModel> famousQuestions = [
    FamousQuestionsModel(icon: ImageConstants.notificationQuestionIcon,
        questionTitle: 'Getting Started',
        questionColor: AppColors.cE2F2FF),

    FamousQuestionsModel(icon: ImageConstants.howToInvestIcon,
        questionTitle: 'How to Invest',
        questionColor: AppColors.cEAFFED),

    FamousQuestionsModel(icon: ImageConstants.notificationQuestionIcon,
        questionTitle: 'Notifications',
        questionColor: AppColors.cE2F2FF),
  ];

}
