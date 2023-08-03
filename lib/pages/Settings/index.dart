import 'package:flutter/material.dart';
import 'package:tecpos/components/app_bar.dart';
import 'package:settings_ui/settings_ui.dart';

import 'Tiles/theme.dart';
import 'Tiles/version.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PosAppBar(
        rootTitle: 'Settings',
      ),
      body: Column(
        children: const [
          Expanded(
            child: SettingsList(
              sections: [
                ThemeSection(),
                InfoSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
