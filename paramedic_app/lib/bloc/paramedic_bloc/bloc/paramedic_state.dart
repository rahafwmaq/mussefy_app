part of 'paramedic_bloc.dart';

@immutable
abstract class ParamedicState {}

class ParamedicInitial extends ParamedicState {}

class ParamedicLoginSuccessState extends ParamedicState {
  final Paramedic paramedic;

  ParamedicLoginSuccessState({required this.paramedic});
}

class ParamedicLoadingState extends ParamedicState {}

class ParamedicErrorState extends ParamedicState {
  final String message;

  ParamedicErrorState({required this.message});
}
