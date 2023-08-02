import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class InfoSection extends AbstractSettingsSection {
  const InfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: Text(
        'About',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      tiles: <SettingsTile>[
        SettingsTile(
          title: const Text(
            'GitHub',
          ),
          leading: const Icon(
            Icons.code,
          ),
          onPressed: null,
        ),
        SettingsTile(
          title: const Text(
            'Info',
          ),
          description: const Text(
            'To Do Later',
          ),
        )
      ],
    );
  }
}
