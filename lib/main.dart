import 'package:flutter/material.dart';
import 'package:tecpos/config/themes.dart';
import 'package:tecpos/routes.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PosApp());
}

class PosApp extends StatelessWidget {
  const PosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      themes: posThemes,
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp.router(
            title: 'TecPos',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routerConfig: posRouterConfig,
          ),
        ),
      ),
    );
  }
}
