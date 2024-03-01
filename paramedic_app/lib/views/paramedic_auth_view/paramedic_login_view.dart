import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/paramedic_bloc.dart';
import 'package:paramedic_app/utilities/functions/loading_screen.dart';
import 'package:paramedic_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/logo_image_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_auth_view/note_paramedic.dart';
import 'package:paramedic_app/views/paramedic_view/paramedic_home_view.dart';

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
            child: SizedBox(
              height: context.getHeight(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      children: [
                        const LogoImageWidget(),
                        height20,
                        TextFormFieldWidget(
                          keyboardType: TextInputType.text,
                          controller: paramedicIDController,
                          labelText: 'ParamedicRegistrationScreen.title'.tr(),
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
                        BlocListener<ParamedicBloc, ParamedicState>(
                          listener: (context, state) {
                            if (state is ParamedicLoginSuccessState) {
                              context.removeUntil(
                                  view: const ParamedicHomeView());
                            } else if (state is ParamedicErrorState) {
                              context.popView();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message)));
                            } else if (state is ParamedicLoadingState) {
                              showLoadingDialog(context);
                            }
                          },
                          child: ClickContainerWidget(
                            onTap: () {
                              context.read<ParamedicBloc>().add(
                                  ParamedicLoginEvent(
                                      moseefyID:
                                          paramedicIDController.text.trim()));
                            },
                            color: blueTransit,
                            text: 'ParamedicRegistrationScreen.buttonText'.tr(),
                            textColor: white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [NoteParamedic()],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
