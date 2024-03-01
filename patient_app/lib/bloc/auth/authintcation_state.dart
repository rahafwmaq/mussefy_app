part of 'authintcation_bloc.dart';

abstract class AuthintcationState {}

class AuthintcationInitial extends AuthintcationState {}

class PatientRegisterationSuccessState extends AuthintcationState {
  final bool stopLoading;

  PatientRegisterationSuccessState({required this.stopLoading});
}

class PatientLoginSuccessState extends AuthintcationState {
  final bool stopLoading;
  final Patient patient;

  PatientLoginSuccessState({required this.stopLoading, required this.patient});
}

class VerficationSuccessState extends AuthintcationState {
  final Patient patient;
  final bool stopLoading;

  VerficationSuccessState({required this.patient, required this.stopLoading});
}

class LoadingState extends AuthintcationState {}

class ErrorState extends AuthintcationState {
  final String message;
  final bool stopLoading;

  ErrorState({required this.message, required this.stopLoading});
}

class SignOutState extends AuthintcationState {}
