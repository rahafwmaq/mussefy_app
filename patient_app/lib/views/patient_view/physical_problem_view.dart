// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/utilities/helpers/delete_dialoge.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/views/patient_view/add_new_mobility_problem.dart';

String? mobilityType;
String? mobilityPlace;

class PhysicalProblemView extends StatelessWidget {
  PhysicalProblemView({super.key, this.patient});

  final Patient? patient;

  TextEditingController problemNameController = TextEditingController();
  TextEditingController problemDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'physical_proplem.title_screen'.tr(),
        centerTitle: true,
        widget: AddNewMobilityProblem(
          problemNameController: problemNameController,
          problemDescriptionController: problemDescriptionController,
          titleAddInfo: 'physical_proplem.title_add_info'.tr(),
          nameLabelText: 'physical_proplem.name_label_text'.tr(),
          mobilityType: mobilityType,
          mobilityPlace: mobilityPlace,
          patient: patient,
        ),
      ),
      body: SizedBox(
        height: context.getHeight(),
        width: context.getWidth(),
        child: BlocBuilder<PatientBloc, PatientBlocSatet>(
          builder: (context, state) {
            if (state is SucssessPatientMobilityProblemState) {
              if (state.mobilityProblem.isEmpty) {
                return Center(
                    child: TextWidget(
                  text: 'x-rays_reports.suggestion'.tr(),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ));
              } else if (state.mobilityProblem.isNotEmpty) {
                return ListView.builder(
                    itemCount: state.mobilityProblem.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: context.getWidth(divide: 1.80),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text:
                                              '${'physical_proplem.physical_proplem_name'.tr()} ${state.mobilityProblem[index].problemName}',
                                        ),
                                        TextWidget(
                                          text:
                                              '${'physical_proplem.physical_proplem_type'.tr()} ${state.mobilityProblem[index].problemType}',
                                        ),
                                        TextWidget(
                                          text:
                                              '${'physical_proplem.physical_proplem_place'.tr()} ${state.mobilityProblem[index].problemPlace}',
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      deleteAlert(
                                        context: context,
                                        onPressed: () {
                                          context.read<PatientBloc>().add(
                                              DeleteMobilityProblemEvent(
                                                  state
                                                      .mobilityProblem[index].id
                                                      .toString(),
                                                  patient!.id!));
                                          Navigator.pop(context);
                                        },
                                        content: state.mobilityProblem[index]
                                            .problemName!,
                                      );
                                    },
                                    child: const TextWidget(
                                      text: 'x',
                                      fontSize: 25,
                                      textColor: red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    });
              }
            } else if (state is ErrorPatientaState) {}
            return const Center(
              child: CircularProgressIndicator(
                color: red,
              ),
            );
          },
        ),
      ),
    );
  }
}
