import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
      child: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return const Text('Error fetching package info');
          }

          final packageInfo = snapshot.data!;

          return SettingsSection(
            title: Text(
              tr('screens.settings.about.title'),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            tiles: <SettingsTile>[
              SettingsTile(
                title: Text(
                  tr(
                    'screens.settings.about.content.github.title',
                  ),
                ),
                description: Text(
                  tr(
                    'screens.settings.about.content.github.description',
                  ),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                leading: const Icon(
                  Icons.code,
                ),
                onPressed: (context) => launchGitHubURL(),
              ),
              SettingsTile(
                leading: const Icon(
                  Icons.info_outline,
                ),
                title: Text(
                  tr(
                    'screens.settings.about.content.info.title',
                  ),
                ),
                description: Text(
                  '${tr('screens.settings.about.content.info.content.appName')}${packageInfo.appName}\n${tr('screens.settings.about.content.info.content.version')}${packageInfo.version}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
