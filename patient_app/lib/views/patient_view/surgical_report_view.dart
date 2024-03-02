// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/utilities/functions/delete_dialoge.dart';
import 'package:mussefy_app/utilities/gloable_data/data.dart';
import 'package:mussefy_app/utilities/gloable_data/globals.dart';
import 'package:mussefy_app/utilities/gloable_widgets/add_new_info_model_sheet_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/drop_down_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/views/patient_view/surgery_widget.dart';

final dropdownSerguryPlacementFormKey = GlobalKey<FormState>();

class SurgicalRecordView extends StatelessWidget {
  SurgicalRecordView({super.key});

  TextEditingController surgeryDateController = TextEditingController();
  TextEditingController surgeryNameController = TextEditingController();
  String? serguryPlace;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: customAppBar(
            context: context,
            title: 'surgical_record.title_screen'.tr(),
            centerTitle: true,
            widget: AddNewInfoModelSheetWidget(
              prosessDateController: surgeryDateController,
              prosessNameController: surgeryNameController,
              titleAddInfo: 'surgical_record.title_add_info'.tr(),
              nameLabelText: 'surgical_record.name_label_text'.tr(),
              dateLabelText: 'surgical_record.date_label_text'.tr(),
              onPressed: () {},
              dropDownWidget: DropDownWidget(
                dropdownFormKey: dropdownSerguryPlacementFormKey,
                hintTextDropDownMenu:
                    'dropDownPlacementIssue.hint_text_surgical_place'.tr(),
                dropdownItems: placementIssue,
                onSelect: (newValue) {
                  serguryPlace = newValue!;
                },
              ),
              type: 'surgery_reports',
            ),
          ),
          body: SizedBox(
            height: context.getHeight(),
            width: context.getWidth(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: BlocBuilder<PatientBloc, PatientBlocSatet>(
                  builder: (context, state) {
                if (state is UpdateSurgeryListState) {
                  surgeryNameController.clear();
                  surgeryDateController.clear();
                  print("here");
                  if (state.surgeries.isEmpty) {
                    return Center(
                        child: TextWidget(
                      text: 'x-rays_reports.suggestion'.tr(),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: state.surgeries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: const Key("index"),
                          confirmDismiss: (direction) async {
                            final x = await deleteAlert(
                                context: context,
                                content: state.surgeries[index].label!,
                                onPressed: () {
                                  context.read<PatientBloc>().add(
                                      DeleteSurgeryEvent(
                                          surgeryId: state.surgeries[index].id!,
                                          patientId:
                                              globalCurrentPatient!.id!));
                                  context.popView();
                                });
                            return Future.value(x == 'cancel');
                          },
                          child: SurgeryWidget(
                            surgery: state.surgeries[index],
                          ),
                        );
                      },
                    );
                  }
                }
                return const Center(
                    child: CircularProgressIndicator(color: red));
              }),
            ),
          )),
    );
  }
}
