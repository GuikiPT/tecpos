import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
                  leading: const Icon(FeatherIcons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    context.go('/settings');
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
