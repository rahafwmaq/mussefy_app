import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/models/patient_model.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';

import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PatientbarcodeCard extends StatelessWidget {
  const PatientbarcodeCard({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getWidth(divide: 1.75),
      width: context.getWidth(divide: 2.90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title:
                      TextWidget(text: 'print_medical_card.confirm_mess'.tr()),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Center(
                          child: TextWidget(
                        text: 'print_medical_card.ok'.tr(),
                        textColor: red,
                        fontSize: 18,
                      )),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.print_rounded,
            ),
          ),
          height20,
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: blueTransit, width: 2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: lightGrey, blurRadius: 20)],
              ),
              height: context.getWidth(divide: 3.5),
              width: context.getWidth(divide: 3.5),
              child: QrImageView(
                data: patient.id.toString(),
                size: 50,
                padding: const EdgeInsets.all(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
