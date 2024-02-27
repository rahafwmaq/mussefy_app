import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/onboarding_view/translations_icon_widget.dart';
import 'package:mussefy_app/views/paramedic_view/paramedic_auth_view/paramedic_login_view.dart';
import 'package:mussefy_app/views/patient_view/patient_auth_view/patient_login_view.dart';

class SelectUserView extends StatelessWidget {
  const SelectUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const TranslationIconWidget(),
            height30,
            const TextWidget(text: 'Are you  '),
            height50,
            height50,
            height16,
            Image.asset('assets/images/logo_point_red.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    context.pushView(view:  ParamedicLoginView());
                  },
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo_red.png'),
                      height10,
                      const TextWidget(
                        text: 'Paramedic',
                        textColor: red,
                        fontSize: 20,
                      )
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      context.pushView(view:  PatientLoginView());
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_blue.png'),
                        height10,
                        const TextWidget(
                          text: 'User',
                          textColor: blue,
                          fontSize: 20,
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
