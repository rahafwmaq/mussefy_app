import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

class NoteParamedic extends StatelessWidget {
  const NoteParamedic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(divide: 1.30),
      child: RichText(
        text: TextSpan(
          text: 'ParamedicRegistrationScreen.pre'.tr(),
          style: const TextStyle(color: blue, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: 'ParamedicRegistrationScreen.note'.tr(),
                style: const TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
