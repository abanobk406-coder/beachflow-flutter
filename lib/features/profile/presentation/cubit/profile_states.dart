import 'package:por2/domain/entities/response/user.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final User user;
  ProfileSuccessState({required this.user});
}

class ProfileErrorState extends ProfileStates {
  final String message;
  ProfileErrorState({required this.message});
}

class ProfileUpdateLoadingState extends ProfileStates {}

class ProfileUpdateSuccessState extends ProfileStates {
  final User user;
  ProfileUpdateSuccessState({required this.user});
}

class ProfileUpdateErrorState extends ProfileStates {
  final String message;
  ProfileUpdateErrorState({required this.message});
}

