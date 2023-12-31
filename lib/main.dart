import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tecpos/config/themes.dart';
import 'package:tecpos/routes.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('pt', 'PT'),
          Locale('en', 'GB'),
        ],
        path: 'assets/i18n',
        startLocale: const Locale('pt', 'PT'),
        child: const PosApp(),
      ),
    ),
  );
}

class PosApp extends StatelessWidget {
  const PosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        ),
      ),
    );
  }
}
