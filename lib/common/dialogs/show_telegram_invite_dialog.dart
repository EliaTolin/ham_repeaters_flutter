import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/common/extension/l10n_extension.dart';
import 'package:quiz_radioamatori/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:quiz_radioamatori/config/app_configs.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> showTelegramInviteDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.telegram, size: 50, color: Colors.blueAccent),
              const SizedBox(height: 10),
              Text(
                context.localization.joinCommunityTitle,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                context.localization.joinCommunityDescription,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.group, color: Colors.blueAccent),
                    title: Text(context.localization.benefitSupportMembers),
                  ),
                  ListTile(
                    leading: const Icon(Icons.lightbulb_outline, color: Colors.blueAccent),
                    title: Text(context.localization.benefitSuggestFeatures),
                  ),
                  ListTile(
                    leading: const Icon(Icons.developer_mode, color: Colors.blueAccent),
                    title: Text(context.localization.benefitContactDevelopers),
                  ),
                  ListTile(
                    leading: const Icon(Icons.chat_bubble, color: Colors.blueAccent),
                    title: Text(context.localization.benefitActiveCommunity),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final telegramUrl = AppConfigs.getTelegramLink();
                      if (await canLaunchUrlString(telegramUrl)) {
                        await launchUrlString(telegramUrl);
                      } else {
                        if (context.mounted) {
                          showErrorSnackbar(context, context.localization.errorOpenTelegram);
                        }
                      }
                    },
                    child: Text(context.localization.joinNowButton),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(context.localization.laterButton),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
