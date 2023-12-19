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
    final getCurrentPath = ModalRoute.of(context)?.settings.name;

    String finalAppBarTitle = rootTitle.isNotEmpty ? ' - $rootTitle' : '';

    return AppBar(
      title: Text('TecPos $finalAppBarTitle'),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
      leading: (getCurrentPath == 'Settings')
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.undo_outlined),
            )
          : null,
    );
  }
}
