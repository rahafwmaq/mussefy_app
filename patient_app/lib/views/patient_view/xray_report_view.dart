// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/utilities/functions/delete_dialoge.dart';
import 'package:mussefy_app/utilities/gloable_data/globals.dart';
import 'package:mussefy_app/utilities/gloable_widgets/add_new_info_model_sheet_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/views/patient_view/xray_widget.dart';

class XRaysReportsView extends StatelessWidget {
  XRaysReportsView({super.key});

  TextEditingController xrayDateController = TextEditingController();
  TextEditingController xrayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'x-rays_reports.title_screen'.tr(),
        centerTitle: true,
        widget: AddNewInfoModelSheetWidget(
          prosessDateController: xrayDateController,
          prosessNameController: xrayNameController,
          titleAddInfo: 'x-rays_reports.title_add_info'.tr(),
          nameLabelText: 'x-rays_reports.name_label_text'.tr(),
          dateLabelText: 'x-rays_reports.date_label_text'.tr(),
          onPressed: () {
            print(xrayNameController);
            print(xrayDateController);
          },
          type: 'xray_reports',
        ),
      ),
      body: SizedBox(
        height: context.getHeight(),
        width: context.getWidth(),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: BlocBuilder<PatientBloc, PatientBlocSatet>(
              builder: (context, state) {
                if (state is ErrorPatientaState) {
                  return Center(child: Text(state.message));
                }
                if (state is UpdateXrayListState) {
                  if (state.xrayList.isEmpty) {
                    print("here");
                    return Center(
                        child: TextWidget(
                      text: 'x-rays_reports.suggestion'.tr(),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: state.xrayList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: const Key("index"),
                          confirmDismiss: (direction) async {
                            final x = await deleteAlert(
                                context: context,
                                content: state.xrayList[index].label!,
                                onPressed: () {
                                  context.read<PatientBloc>().add(
                                      DeleteXrayEvent(
                                          xrayId: state.xrayList[index].id!,
                                          patientId:
                                              globalCurrentPatient!.id!));
                                  context.popView();
                                });
                            return Future.value(x == 'cancel');
                          },
                          child: XrayWidget(
                            xray: state.xrayList[index],
                          ),
                        );
                      },
                    );
                  }
                }
                return const Center(
                    child: CircularProgressIndicator(color: red));
              },
            )),
      ),
    );
  }
}
