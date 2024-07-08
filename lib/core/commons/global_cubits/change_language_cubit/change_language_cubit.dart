import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  bool isArabic=false;
  String langCode='en';
  String desiredCode='';

  changeLang()
  {
    emit(ChangeLanguageLoading());
    if(langCode==desiredCode)
    {
      return;
    }
    langCode=isArabic?'en':'ar';
    isArabic=!isArabic;
    emit(ChangeLanguageSuccess());

  }


}
