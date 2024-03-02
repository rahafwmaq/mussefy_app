import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:paramedic_app/database/supa_auth/supa_auth.dart';
import 'package:paramedic_app/database/supa_get_delete/supa_get_delete.dart';
import 'package:paramedic_app/models/paramedic_model.dart';

part 'paramedic_event.dart';
part 'paramedic_state.dart';

class ParamedicBloc extends Bloc<ParamedicEvent, ParamedicState> {
  ParamedicBloc() : super(ParamedicInitial()) {
    on<ParamedicLoginEvent>((event, emit) async {
      emit(ParamedicLoadingState());
      if (event.moseefyID.isEmpty) {
        emit(ParamedicErrorState(
          message: 'ParamedicRegistrationScreen.validatorMessage'.tr(),
        ));
      } else {
        try {
          final paramedic =
              await SupaGetAndDelete().getParamedic(event.moseefyID);
          if (paramedic == null) {
            emit(ParamedicErrorState(
              message: 'ParamedicRegistrationScreen.notfoundmessage'.tr(),
            ));
          } else {
            final response2 = await SupaAuth()
                .loginParamedic(paramedic.email!, paramedic.email!);
            emit(ParamedicLoginSuccessState(paramedic: paramedic));
          }
        } catch (error) {
          print(error);
          emit(ParamedicErrorState(
            message: 'ParamedicRegistrationScreen.errorMessage'.tr(),
          ));
        }
      }
    });
  }
}
