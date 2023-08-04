import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpos/components/language_selector.dart';

class PosDrawer extends StatelessWidget {
  const PosDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/logo-banner.svg',
                        semanticsLabel: 'TecBased',
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: Text(
                    tr('screens.settings.name'),
                  ),
                  onTap: () {
                    context.push('/settings');
                  },
                ),
                ListTile(
                  title: const LanguageSelector(),
                  onTap: () {
                    showLanguageSelectorDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
