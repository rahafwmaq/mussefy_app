import 'package:flutter/material.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/surgery_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/Container_card.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:url_launcher/url_launcher.dart';



// ignore_for_file: must_be_immutable


final dropdownSerguryPlacementFormKey = GlobalKey<FormState>();

class PatientSurgeryReportView extends StatelessWidget {
  PatientSurgeryReportView({super.key});

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
                        return SurgeryWidget(
                            surgery: state.surgeries[index],
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




class SurgeryWidget extends StatelessWidget {
  const SurgeryWidget({
    super.key,
    required this.surgery,
  });
  final SurgeryModel surgery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ContainerCard(
        height: 100,
        width: context.getWidth(divide: 1.15),
        borderColor: noColor,
        borderWidth: 0,
        borderRadius: 20,
        containerColor: white,
        blurRadius: 20,
        shadowColor: const Color.fromARGB(34, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text:
                        '${'surgical_record.surgical_record_name'.tr()} ${surgery.label}',
                  ),
                  TextWidget(
                    text:
                        '${'surgical_record.surgical_record_date'.tr()} ${surgery.date}',
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(surgery.surgeryReport!);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch report');
                  }
                },
                icon: const Icon(
                  Icons.file_present_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
