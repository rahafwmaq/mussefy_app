import 'package:flutter/material.dart';
import 'package:paramedic_app/models/allergies_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/wedgets/continerw.dart';
import 'package:paramedic_app/views/paramedic_view/wedgets/text.dart';

class Alergises extends StatelessWidget {
  const Alergises({super.key, this.allergies, this.patient});
  final Patient? patient;

  final List<Allergies>? allergies;

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
              itemCount: allergies!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (allergies!.isEmpty) {
                  return const Center(child: TextWidget(text: 'No Allergies'));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextW(
                            text: '- ${allergies![index].allergiesName}',
                            colorText: gray,
                          ),
                        ],
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
