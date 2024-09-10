part of 'change_theme_cubit.dart';

@immutable
sealed class ChangeThemeState {}

final class ChangeLanguageInitial extends ChangeThemeState {}


final class ChangeThemeToAnotherState extends ChangeThemeState {}

