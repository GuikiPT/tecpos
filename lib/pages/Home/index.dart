import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpos/components/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PosAppBar(
        rootTitle: 'Home',
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/login');
          },
          child: const Text('Home'),
        ),
      ),
    );
  }
}
