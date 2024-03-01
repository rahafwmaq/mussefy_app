import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_data/data.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class MedicalHistoryCard extends StatelessWidget {
  const MedicalHistoryCard({
    super.key,
  });

  // final Patient patient;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 20),
      itemCount: home.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                context.pushView(view: home[index]["view"]);
                // context.read<PatientBloc>().add(
                //     GetdataEvent(patient.id!, patient, home[index]["type"]));
              },
              child: ContainerWidget(
                  shadowColor: const Color.fromARGB(60, 0, 0, 0),
                  blurRadius: 10,
                  height: context.getWidth(divide: 3),
                  width: context.getWidth(divide: 3),
                  borderColor: noColor,
                  borderWidth: 0,
                  borderRadius: 20,
                  containerColor: white,
                  child:
                      Image.asset(home[index]["image"], scale: 6, color: red)),
            ),
            height10,
            TextWidget(
              text: home[index]["title"],
              textColor: black,
              fontSize: 18,
            ),
          ],
        );
      },
    );
  }
}
