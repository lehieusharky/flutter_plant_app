import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';

class SendEmailButton extends StatefulWidget {
  const SendEmailButton({super.key});

  @override
  State<SendEmailButton> createState() => _SendEmailButtonState();
}

class _SendEmailButtonState extends State<SendEmailButton> {
  final Email email = Email(
    body: 'noi dung can bo sung',
    subject: 'Gop y bo sung cho app',
    recipients: [],
    cc: ['lehieultt@gmail.com', 'myytb20095511@gmail.com'],
    attachmentPaths: [],
    isHTML: false,
  );

  @override
  Widget build(BuildContext context) {
    return SettingButton(
      title: translate(context).contactWithUs,
      field: '',
      onPressed: () async {
        await FlutterEmailSender.send(email);
      },
      iconTitlePath: imageConstant.contactUsSVG,
    );
  }
}
