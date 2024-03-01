import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';

class EmergencyContactView extends StatelessWidget {
  const EmergencyContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          widget: Container(),
          title: 'AI.title'.tr(),
          centerTitle: true),
      body: Center(child: TextWidget(text: 'Emergency Contact View')),
    );
  }
}
