import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/models/XRay_model.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:url_launcher/url_launcher.dart';

class XrayWidget extends StatelessWidget {
  const XrayWidget({
    super.key,
    required this.xray,
  });
  final XRay xray;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ContainerWidget(
        height: 100,
        width: context.getWidth(divide: 1.15),
        borderColor: noColor,
        borderWidth: 0,
        borderRadius: 20,
        containerColor: white,
        blurRadius: 20,
        shadowColor: const Color.fromARGB(34, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text:
                        '${'x-rays_reports.x-rays_reports_name'.tr()} ${xray.label}',
                  ),
                  TextWidget(
                    text:
                        '${'x-rays_reports.x-rays_reports_date'.tr()} ${xray.date}',
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(xray.xrayReport!);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch report');
                  }
                },
                icon: const Icon(
                  Icons.file_present_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
