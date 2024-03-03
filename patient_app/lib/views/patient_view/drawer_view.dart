import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/auth/authintcation_bloc.dart';
import 'package:mussefy_app/bloc/auth/authintcation_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/patient_model.dart';
import 'package:mussefy_app/utilities/gloable_data/globals.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/utilities/helpers/signout_dialog.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_auth_view/patient_login_view.dart';
import 'package:mussefy_app/views/patient_view/drawer_content.dart';
import 'package:mussefy_app/views/patient_view/patient_account_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key, required this.patient});
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.getHeight(divide: 8)),
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  File image;
                  final ImagePicker picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    image = File(pickedFile.path);
                    //print(image.path);
                    context.read<PatientBloc>().add(UploadProfilePictureEvent(
                        imageFile: image, patient: patient));
                  }
                },
                child: BlocBuilder<PatientBloc, PatientBlocSatet>(
                  builder: (context, state) {
                    if (state is LoadingPatientaState) {
                      return const Center(
                          child: CircularProgressIndicator(color: red));
                    }
                    return ClipOval(
                      child: (profileImage == null || profileImage!.isEmpty)
                          ? Image.asset(
                              'assets/images/profile_pic.png',
                              height: context.getHeight(divide: 8),
                            )
                          : CachedNetworkImage(
                              imageUrl: profileImage!,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(color: white),
                              height: context.getHeight(divide: 8),
                            ),
                    );
                  },
                ),
              ),
              height10,
              TextWidget(
                text: globalCurrentPatient!.fullName!,
                fontSize: 18,
              ),
              height10,
              const Divider(
                color: red,
              ),
              height10,
              DrawerContent(
                rowTitle: 'drawer_widget.account'.tr(),
                icon: Icons.account_circle_outlined,
                onPressd: () {
                  context.pushView(
                      view: PatientAccount(
                    patient: patient,
                  ));
                },
              ),
              height10,
              DrawerContent(
                rowTitle: 'drawer_widget.language'.tr(),
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
                rowTitle: 'drawer_widget.signout'.tr(),
                icon: Icons.logout_rounded,
                onPressd: () {
                  signOutAlert(
                      context: context,
                      content: '',
                      onPressed: () {
                        context.read<AuthintcationBloc>().add(SignOutEvent());
                        context.removeUntil(view: PatientLoginView());
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
