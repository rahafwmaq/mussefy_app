import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/views/paramedic_view/paramedic_home_view/paramedic_home_view.dart';

class ParamedicLoginView extends StatelessWidget {
  ParamedicLoginView({super.key});

  final TextEditingController paramedicIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/mussefy_logo.png'),
            TextWidget(text: 'مسعفي'),
            TextWidget(text: 'الثواني الأولى تشكل الفرق'),
            TextWidget(text: 'text'),
            TextFormFieldWidget(
              
              keyboardType: TextInputType.text,
              controller: paramedicIDController,
              labelText: 'Mussefy ID',
              labelTextColor: red,
              controllerTextColor: black,
              cursorColor: red,
              obscureText: false,
              suffixIcon: const Icon(
                Icons.person,
                color: red,
              ),
            ),
            ClickContainerWidget(
              onTap: () {
                context.removeUntil(view: const ParamedicHomeView());
              },
              color: blueTransit,
              text: 'Login',
              textColor: white,
              fontSize: 22,
            ),
            Row(
              children: [
                TextWidget(text: 'text'),
                TextWidget(text: 'text'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
