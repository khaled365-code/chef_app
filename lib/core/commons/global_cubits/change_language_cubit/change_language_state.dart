part of 'change_language_cubit.dart';

@immutable
sealed class ChangeLanguageAndThemeState {}

final class ChangeLanguageInitial extends ChangeLanguageAndThemeState {}

final class ChangeLanguageToAnotherState extends ChangeLanguageAndThemeState {}


final class ChangeThemeToAnotherState extends ChangeLanguageAndThemeState {}

