import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/logo_image.dart';
import 'package:mussefy_app/utilities/gloable_widgets/previous_icon_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/paramedic_view/paramedic_auth_view/note_paramedic.dart';
import 'package:mussefy_app/views/paramedic_view/paramedic_home_view/paramedic_home_view.dart';

class ParamedicLoginView extends StatelessWidget {
  ParamedicLoginView({super.key});

  final TextEditingController paramedicIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PreviousPageIconWidget(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Column(
                    children: [
                      const LogoImage(),
                      height20,
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
                      height40,
                      ClickContainerWidget(
                        onTap: () {
                          context.removeUntil(view: const ParamedicHomeView());
                        },
                        color: blueTransit,
                        text: 'Login',
                        textColor: white,
                        fontSize: 22,
                      ),
                      height70,
                      height30,
                      const NoteParamedic()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
