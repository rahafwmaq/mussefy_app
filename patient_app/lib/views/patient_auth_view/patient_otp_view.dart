import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/auth/authintcation_bloc.dart';
import 'package:mussefy_app/utilities/functions/loading_screen.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/patient_home_view.dart';
import 'package:pinput/pinput.dart';

class PatientOTPView extends StatelessWidget {
  const PatientOTPView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    String otp = "";

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: SizedBox(
                height: context.getHeight(),
                child: Column(
                  children: [
                    Image.asset('assets/images/mussefy_logo.png'),
                    height20,
                    const TextWidget(
                      text: 'OTP',
                      textColor: red,
                      fontSize: 40,
                    ),
                    TextWidget(
                      text: "${'otpscreen.message'.tr()}  $email",
                      textColor: blue,
                      fontSize: 20,
                    ),
                    height20,
                    Pinput(
                      length: 6,
                      showCursor: true,
                      onCompleted: (pin) => otp = pin,
                    ),
                    height40,
                    BlocListener<AuthintcationBloc, AuthintcationState>(
                      listener: (context, state) {
                        if (state is VerficationSuccessState) {
                          context.removeUntil(view: const PatientHomeView());
                        } else if (state is ErrorState) {
                          if (state.stopLoading) {
                            context.popView();
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        } else if (state is LoadingState) {
                          showLoadingDialog(context);
                        }
                      },
                      child: ClickContainerWidget(
                        onTap: () {
                          context.removeUntil(view: const PatientHomeView());
                        },
                        color: blueTransit,
                        text: 'otpscreen.buttonText'.tr(),
                        textColor: white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
