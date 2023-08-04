import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tecpos/components/language_selector.dart';

class LanguageSection extends AbstractSettingsSection {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SettingsSection(
        title: Text(
          tr('screens.settings.language.title'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        tiles: <SettingsTile>[
          SettingsTile(
            title: Text(
              tr(
                'screens.settings.language.content.choose_lang.title',
              ),
            ),
            description: Text(
              tr('screens.settings.language.content.choose_lang.description'),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            leading: const Icon(
              Icons.language_outlined,
            ),
            onPressed: (context) => showLanguageSelectorDialog(context),
          )
        ],
      ),
    );
  }
}
