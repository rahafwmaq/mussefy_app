import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/auth/authintcation_event.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/services/auth_services.dart';
import 'package:mussefy_app/utilities/helpers/format.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'authintcation_state.dart';

class AuthintcationBloc extends Bloc<AuthintcationEvent, AuthintcationState> {
  Patient? newPatient;
  AuthintcationBloc() : super(AuthintcationInitial()) {
    on<PatientRegisterationEvent>((event, emit) async {
      emit(LoadingState());
      if (event.name.isNotEmpty &&
          event.password.isNotEmpty &&
          event.phone.isNotEmpty &&
          event.email.isNotEmpty) {
        if (FormatCheck().checkEmailFormat(event.email) == false) {
          emit(ErrorState(
              message: 'Patient_regestraion_screen.emailFormatError'.tr(),
              stopLoading: true));
        }
        if (FormatCheck().checkPhone(event.phone) == false) {
          emit(ErrorState(
              message: 'Patient_regestraion_screen.phoneFormatError'.tr(),
              stopLoading: true));
        }
        if (FormatCheck().checkPasswordLength(event.password) == false) {
          emit(ErrorState(
              message: 'Patient_regestraion_screen.passwordFormatError'.tr(),
              stopLoading: true));
        } else {
          try {
            newPatient = Patient(
                fullName: event.name,
                email: event.email,
                phoneNumber: event.phone);
            emit(PatientRegisterationSuccessState(stopLoading: true));
          } on AuthException {
            emit(ErrorState(
                message: 'Patient_regestraion_screen.authException'.tr(),
                stopLoading: true));
          } catch (error) {
            emit(ErrorState(
                message: 'Patient_regestraion_screen.errorMessage'.tr(),
                stopLoading: true));
          }
        }
      } else {
        emit(ErrorState(
            message: 'Patient_regestraion_screen.validatorMessage'.tr(),
            stopLoading: true));
      }
    });
    on<VerficationEvent>((event, emit) async {
      emit(LoadingState());
      if (newPatient != null) {
        try {
          final response = await AuthService()
              .verfiyOTP(event.email, event.pin, newPatient!);
          if (response.isNotEmpty) {
            emit(VerficationSuccessState(
                patient: newPatient!, stopLoading: true));
          }
        } on AuthException {
          emit(ErrorState(
              message: 'Patient_regestraion_screen.authException'.tr(),
              stopLoading: true));
        } catch (error) {
          print(error);
          emit(ErrorState(
              message: 'Patient_regestraion_screen.errorMessage'.tr(),
              stopLoading: true));
        }
      }
    });
    on<PatientLoginEvent>((event, emit) async {
      print("in PatientLoginEvent ");
      emit(LoadingState());
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(ErrorState(
            message: 'Patient_regestraion_screen.validatorMessage'.tr(),
            stopLoading: true));
      } else {
        try {
          final Patient curr =
              await AuthService().loginPatient(event.email, event.password);
          emit(PatientLoginSuccessState(stopLoading: true, patient: curr));
        } on AuthException {
          emit(ErrorState(
              message: 'Patient_login_screen.authException'.tr(),
              stopLoading: true));
        } catch (error) {
          emit(ErrorState(
              message: 'Patient_login_screen.errorMessage'.tr(),
              stopLoading: true));
        }
      }
    });

    on<SignOutEvent>((event, emit) async {
      await AuthService().signOutPatient();
      emit(SignOutState());
    });
  }
}
