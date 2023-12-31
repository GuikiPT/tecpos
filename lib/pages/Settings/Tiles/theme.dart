import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tecpos/components/theme_picker.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeSection extends AbstractSettingsSection {
  const ThemeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actualTheme = ThemeProvider.themeOf(context).id;
    final initialValueForDarkMode =
        (actualTheme == 'dark') || actualTheme.contains('-dark') ? true : false;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SettingsSection(
        title: Text(
          tr('screens.settings.theme.title'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        tiles: <SettingsTile>[
          SettingsTile.switchTile(
            title: const Text(
              'Dark Mode',
            ),
            description: Text(
              'Ativar o Dark Mode no TecPos',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onToggle: (value) {
              if (actualTheme.contains('-light')) {
                ThemeProvider.controllerOf(context).setTheme(
                  actualTheme.replaceAll('-light', '-dark'),
                );
                ThemeProvider.controllerOf(context).saveThemeToDisk();
              } else {
                ThemeProvider.controllerOf(context).setTheme(
                  actualTheme.replaceAll('-dark', '-light'),
                );
              }
            },
            initialValue: initialValueForDarkMode,
            leading: const Icon(Icons.dark_mode_outlined),
          ),
          SettingsTile.navigation(
            leading: const Icon(Icons.format_paint_outlined),
            title: const Text(
              'Temas',
            ),
            onPressed: (context) {
              return showDialog(
                context: context,
                builder: (_) => PosThemeDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
