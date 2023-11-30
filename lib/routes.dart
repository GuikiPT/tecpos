import 'package:go_router/go_router.dart';
import 'package:tecpos/pages/Home/index.dart';
import 'package:tecpos/pages/Login/index.dart';
import 'package:tecpos/pages/Settings/index.dart';
import 'package:theme_provider/theme_provider.dart';

final posRouterConfig = GoRouter(routes: [
  GoRoute(
    name: 'Home',
    builder: (context, state) => const ThemeConsumer(
      child: HomePage(),
    ),
    path: '/home',
  ),
  GoRoute(
    name: 'Login',
    builder: (context, state) => const ThemeConsumer(
      child: LoginPage(),
    ),
    path: '/login',
  ),
  GoRoute(
    name: 'Settings',
    builder: (context, state) => const ThemeConsumer(
      child: SettingsPage(),
    ),
    path: '/settings',
  ),
], initialLocation: '/login');
