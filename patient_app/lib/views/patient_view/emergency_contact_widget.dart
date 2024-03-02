
import 'package:flutter/material.dart';
import 'package:mussefy_app/models/EmergencyContact_model.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactWidget extends StatelessWidget {
  const EmergencyContactWidget({
    super.key,
    required this.contact,
  });

  final EmergencyContact contact;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: white,
        child: ListTile(
          title: TextWidget(
            text: contact.name!,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          subtitle: TextWidget(text: contact.phoneNumber!, fontSize: 20),
          trailing: IconButton(
              onPressed: () async {
                // replace with the actual phone number
                Uri uri = Uri.parse('tel:${contact.phoneNumber!}');
                if (!await launchUrl(uri)) {
                  debugPrint('Could not launch $uri');
                }
              },
              icon: const Icon(size: 30, Icons.phone, color: red)),
        ));
  }
}
