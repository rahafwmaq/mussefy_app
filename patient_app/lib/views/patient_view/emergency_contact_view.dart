// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/EmergencyContact_model.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/helpers/delete_dialoge.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/views/patient_view/add_new_emergency_contact.dart';
import 'package:mussefy_app/views/patient_view/emergency_contact_widget.dart';

class EmergencyContactView extends StatelessWidget {
  EmergencyContactView(
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
            widget: AddNewEmergency(
              patient: patient,
              titleAddInfo: 'drawer_emergency_contact.title_screen'.tr(),
            ),
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
                        return Dismissible(
                            key: const Key("index"),
                            confirmDismiss: (direction) async {
                              final x = await deleteAlert(
                                  context: context,
                                  content: contactList[index].name!,
                                  onPressed: () {
                                    context.read<PatientBloc>().add(
                                        DeleteEmergenceyContact(
                                            contactID: contactList[index].id!,
                                            patientId: patient.id!));
                                    context.popView();
                                  });
                              return Future.value(x == 'cancel');
                            },
                            child: EmergencyContactWidget(
                                contact: contactList[index]));
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
