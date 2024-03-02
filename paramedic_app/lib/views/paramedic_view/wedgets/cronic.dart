import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/models/chronic_disease_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/wedgets/continerw.dart';

class CronicDisease extends StatelessWidget {
  const CronicDisease({super.key, this.chronicDisease, this.patient});

  final List<ChronicDisease>? chronicDisease;
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ContainerW(
        width: context.getWidth(divide: 1.15),
        borderColor: noColor,
        borderWidth: 0,
        borderRadius: 20,
        containerColor: white,
        blurRadius: 10,
        shadowColor: const Color.fromARGB(34, 0, 0, 0),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView.builder(
              itemCount: chronicDisease!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (chronicDisease!.isEmpty) {
                  return const Center(
                      child: TextWidget(text: 'No Chronic Disease'));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: '- ${chronicDisease![index].disease}',
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            )),
      ),
    );
  }
}
