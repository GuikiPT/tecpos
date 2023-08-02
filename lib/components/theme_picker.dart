import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theme_provider/theme_provider.dart';

typedef ColorBuilderByAppTheme = Color Function(AppTheme theme);

class PosThemeDialog extends StatelessWidget {
  final Widget title;
  final bool hasDescription;
  final double innerCircleRadius;
  final ColorBuilderByAppTheme? innerCircleColorBuilder;
  final ColorBuilderByAppTheme? outerCircleColorBuilder;
  final int animatedOpacityDuration;
  final Widget selectedThemeIcon;
  final Color selectedOverlayColor;

  PosThemeDialog({
    Key? key,
    this.title = const Text("Escolha o Tema"),
    this.hasDescription = true,
    this.innerCircleRadius = 15,
    this.innerCircleColorBuilder,
    this.outerCircleColorBuilder,
    this.animatedOpacityDuration = 200,
    this.selectedOverlayColor = const Color(0x669E9E9E),
    this.selectedThemeIcon = const Icon(Icons.check, color: Colors.white),
  }) : super(key: key) {
    assert(innerCircleRadius <= 20, "Inner circle max radius exceeds is 20px");
  }

  @override
  Widget build(BuildContext context) {
    String currentThemeId = ThemeProvider.themeOf(context).id;
    bool isDarkMode = currentThemeId.contains('-dark');

    final List<AppTheme> filteredThemes;
    filteredThemes = ThemeProvider.controllerOf(context)
        .allThemes
        .where(
          (theme) =>
              !theme.id.toLowerCase().contains(isDarkMode ? '-light' : '-dark'),
        )
        .toList();
    filteredThemes.sort((a, b) => a.id.compareTo(b.id));

    return AlertDialog(
      title: title,
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: filteredThemes
              .map<Widget>(
                  (theme) => _buildThemeTile(context, theme, currentThemeId))
              .toList(),
        ),
      ),
    );
  }

  String _capitalize(String s) {
    if (s.isEmpty) {
      return s;
    } else if (s.length == 1) {
      return s.toUpperCase();
    } else {
      return s[0].toUpperCase() + s.substring(1);
    }
  }

  Widget _buildThemeTile(
    BuildContext context,
    AppTheme theme,
    String currentThemeId,
  ) {
    String themeName = theme.id
        .split("_")
        .map(_capitalize)
        .join(" ")
        .replaceAll('-light', '')
        .replaceAll('-dark', '');

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListTile(
        style: ThemeProvider.themeOf(context).data.listTileTheme.style,
        leading: Stack(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: outerCircleColorBuilder != null
                  ? outerCircleColorBuilder!(theme)
                  : theme.data.colorScheme.secondary,
              child: CircleAvatar(
                backgroundColor: innerCircleColorBuilder?.call(theme) ??
                    theme.data.primaryColor,
                radius: innerCircleRadius,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: animatedOpacityDuration),
              opacity: theme.id == currentThemeId ? 1 : 0,
              child: CircleAvatar(
                backgroundColor: selectedOverlayColor,
                child: selectedThemeIcon,
              ),
            ),
          ],
        ),
        title: Text(themeName),
        subtitle: hasDescription ? Text(theme.description) : null,
        onTap: () => {
          ThemeProvider.controllerOf(context).setTheme(theme.id),
          ThemeProvider.controllerOf(context).saveThemeToDisk(),
          Navigator.of(context)
              .pop(), // Close the dialog after selecting a theme
        },
      ),
    );
  }
}
