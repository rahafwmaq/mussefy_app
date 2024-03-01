import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_data/data.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class MedicalHistoryCard extends StatelessWidget {
  const MedicalHistoryCard({
    super.key, required this.patient,
  });

   final Patient patient;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: home.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                context.pushView(view: home[index]["view"]);
                context.read<PatientBloc>().add(
                    GetdataEvent(patient.id!, patient, home[index]["type"]));
              },
              child: ContainerWidget(
                shadowColor: lightGrey,
                blurRadius: 8,
                height: context.getWidth(divide: 2.5),
                width: context.getWidth(divide: 2),
                borderColor: noColor,
                borderWidth: 0,
                borderRadius: 20,
                containerColor: white,
                child: Column(
                  children: [
                    height10,
                    Image.asset(home[index]["image"], scale: 6, color: red),
                    height20,
                    TextWidget(
                      text: home[index]["title"],
                      textColor: black,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
