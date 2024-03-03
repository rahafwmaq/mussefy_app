// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/XRay_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/Container_card.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

class PatientXrayReportView extends StatelessWidget {
  PatientXrayReportView({super.key});

  TextEditingController xrayDateController = TextEditingController();
  TextEditingController xrayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'x-rays_reports.title_screen'.tr(),
        centerTitle: true,
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
                        return XrayWidget(
                          xray: state.xrayList[index],
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

class XrayWidget extends StatelessWidget {
  const XrayWidget({
    super.key,
    required this.xray,
  });
  final XRay xray;

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
                        '${'x-rays_reports.x-rays_reports_name'.tr()} ${xray.label}',
                  ),
                  TextWidget(
                    text:
                        '${'x-rays_reports.x-rays_reports_date'.tr()} ${xray.date}',
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(xray.xrayReport!);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch report');
                  }
                },
                icon: const Icon(
                  Icons.file_present_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
