
import 'package:flutter/material.dart';

@immutable
abstract class AuthintcationEvent {}

class PatientRegisterationEvent extends AuthintcationEvent {
  final String name;
  final String email;
  final String password;
  final String phone;

  PatientRegisterationEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});
}

class PatientLoginEvent extends AuthintcationEvent {
  final String email;
  final String password;

  PatientLoginEvent({required this.email, required this.password});
}

class VerficationEvent extends AuthintcationEvent {
  final String pin;
  final String email;

  VerficationEvent({required this.pin, required this.email});
}

class SignOutEvent extends AuthintcationEvent {}
