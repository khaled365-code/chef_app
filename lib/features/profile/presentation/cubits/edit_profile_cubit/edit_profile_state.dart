part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class UpdateProfilePhotoState extends EditProfileState {}


final class DeleteProfilePhotoState extends EditProfileState {}
