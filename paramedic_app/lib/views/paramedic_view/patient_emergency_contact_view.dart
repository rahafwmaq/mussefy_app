// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/EmergencyContact_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/emergency_contact_widget.dart';


class PatientEmergencyContactView extends StatelessWidget {
  PatientEmergencyContactView(
      {super.key, required this.patient, required this.contactList});
  final Patient patient;
  List<EmergencyContact> contactList;

  TextEditingController emergencyNameController = TextEditingController();
  TextEditingController emergencyPhoneController = TextEditingController();
  String? relationship;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            context: context,
    
            title: 'drawer_widget.emergency_contact'.tr(),
            centerTitle: true),
        body: Column(
          children: [
            BlocBuilder<PatientBloc, PatientBlocSatet>(
              builder: (context, state) {
                if (state is UpdateContactListState) {
                  contactList = state.contacts;
                }
                if (state is LoadingPatientaState) {
                  return const Center(
                      child: CircularProgressIndicator(color: red));
                }
                return SizedBox(
                  height: context.getWidth(),
                  width: context.getWidth(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListView.builder(
                      itemCount: contactList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EmergencyContactWidget(
                                contact: contactList[index]);
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
