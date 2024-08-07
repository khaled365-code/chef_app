part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class LocationSwitchedState extends SettingsState {}


final class NotificationSwitchedState extends SettingsState {}


final class DarkModeSwitchedState extends SettingsState {}
