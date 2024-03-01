import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';

class LaboratoryResult extends StatelessWidget {
  const LaboratoryResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: '', centerTitle: true, widget: Container()),
      body: TextWidget(text: 'text'),
    );
  }
}
