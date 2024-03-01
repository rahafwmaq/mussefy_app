import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/drawer_content.dart';
import 'package:mussefy_app/views/patient_view/patient_account_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.getHeight(divide: 8)),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/patient_pic.png',
                  height: context.getHeight(divide: 8),
                ),
              ),
              height10,
              const TextWidget(
                text: 'Khalid Hassan Al-Gamdi',
                fontSize: 18,
              ),
              height10,
              const Divider(
                color: red,
              ),
              height10,
              DrawerContent(
                rowTitle: 'Account',
                icon: Icons.account_circle_outlined,
                onPressd: () {
                  context.pushView(view: PatientAccount());
                },
              ),
              height10,
              DrawerContent(
                rowTitle: 'Arabic',
                icon: Icons.g_translate_outlined,
                onPressd: () {
                  if (context.locale.toString() == "en_US") {
                    context.setLocale(const Locale('ar', 'SA'));
                  } else {
                    context.setLocale(const Locale('en', 'US'));
                  }
                },
              ),
              const Spacer(),
              DrawerContent(
                rowTitle: 'Signout',
                icon: Icons.logout_rounded,
                onPressd: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
