// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/Container_card.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

class PatientLaboratoryReportView extends StatelessWidget {
  const PatientLaboratoryReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.getHeight(),
        width: context.getWidth(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              ContainerCard(
                height: 100,
                width: context.getWidth(divide: 1.15),
                borderColor: noColor,
                borderWidth: 0,
                borderRadius: 20,
                containerColor: white,
                blurRadius: 20,
                shadowColor: const Color.fromARGB(34, 0, 0, 0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                                '${'laboratory_result.laboratory_result_name'.tr()} ${'laboratory_result.laboratory_name'.tr()} ',
                          ),
                          TextWidget(
                            text:
                                '${'laboratory_result.laboratory_result_date'.tr()} 02/03/2023',
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.file_present_rounded,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
