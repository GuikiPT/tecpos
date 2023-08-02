import 'package:flutter/material.dart';

class PosAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String rootTitle;

  const PosAppBar({
    Key? key,
    required this.rootTitle,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('TecPos - $rootTitle'),
      centerTitle: true,
    );
  }
}
