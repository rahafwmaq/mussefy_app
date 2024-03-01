part of 'paramedic_bloc.dart';

@immutable
abstract class ParamedicEvent {}

class ParamedicLoginEvent extends ParamedicEvent {
  final String moseefyID;

  ParamedicLoginEvent({required this.moseefyID});
}
