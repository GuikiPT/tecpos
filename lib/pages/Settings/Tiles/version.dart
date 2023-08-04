import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSection extends AbstractSettingsSection {
  const InfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    launchGitHubURL() async {
      const String url = 'https://github.com/GuikiPT/tecpos';
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SettingsSection(
        title: Text(
          tr('settings.about.title'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        tiles: <SettingsTile>[
          SettingsTile(
            title: Text(
              tr('settings.github.title'),
            ),
            description: Text(
              tr('settings.github.description'),
            ),
            leading: const Icon(
              Icons.code,
            ),
            onPressed: (context) => launchGitHubURL(),
          ),
          SettingsTile(
            title: Text(
              tr('settings.info.title'),
            ),
            description: Text(
              tr('settings.info.description'),
            ),
          ),
        ],
      ),
    );
  }
}
