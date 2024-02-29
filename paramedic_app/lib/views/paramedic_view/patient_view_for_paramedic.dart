import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/container_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/patient_card.dart';

class PatientViewForParamedic extends StatelessWidget {
  const PatientViewForParamedic({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget(
            text: 'Patient\'s Medical History',
          ),
          leading: IconButton(
            onPressed: () {
              context.popView();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 35,
            ),
          ),
        ),
        body: SizedBox(
          width: context.getWidth(),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                height20,
                const PatientCard(),
                height40,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/emergency_contact.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Emergency Contact',
                ),
                height20,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/body_structure.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Body Structure',
                ),
                height20,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/doctor.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Doctor',
                ),
                height20,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/medical.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Medical Reports',
                ),
                height20,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/medication.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Medication',
                ),
                height20,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/surgery.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Surgery Reports',
                ),
                height20,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/X-Rays.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s X-Rays Reports',
                ),
                height20,
                ContainerWidget(
                  onTap: () {},
                  iconPathImage: 'assets/images/laboratory.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Laboratory Reports',
                ),
                height40
              ],
            ),
          )),
        ),
      ),
    );
  }
}
