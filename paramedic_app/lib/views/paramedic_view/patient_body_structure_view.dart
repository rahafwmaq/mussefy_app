import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/key_body_digram.dart';

class PatientBodyStructureView extends StatelessWidget {
  const PatientBodyStructureView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget(text: 'Body Structure'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.popView();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 35,
            ),
          ),
          bottom: const TabBar(
              labelColor: red,
              dividerColor: lightGrey,
              indicatorColor: red,
              tabs: [
                TextWidget(
                  text: 'Front Body',
                ),
                TextWidget(text: 'Back Body')
              ]),
        ),
        body: TabBarView(
          children: [
            SizedBox(
              height: context.getHeight(),
              width: context.getWidth(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/frontbody.png',
                    scale: 1.35,
                  ),
                  const KeyBodyDigram(
                    positionTop: 12,
                    positionLeft: 20,
                    keyName: 'Ingury',
                    color: redTransit,
                  ),
                  const KeyBodyDigram(
                    positionTop: 50,
                    positionLeft: 20,
                    keyName: 'Disability',
                    color: blackTransit,
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.getHeight(),
              width: context.getWidth(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/backbody.png',
                    scale: 1.35,
                  ),
                  const KeyBodyDigram(
                    positionTop: 12,
                    positionLeft: 20,
                    keyName: 'Ingury',
                    color: redTransit,
                  ),
                  const KeyBodyDigram(
                    positionTop: 50,
                    positionLeft: 20,
                    keyName: 'Disability',
                    color: blackTransit,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
