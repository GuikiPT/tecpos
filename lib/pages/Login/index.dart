import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecpos/components/app_bar.dart';
import 'package:tecpos/components/app_drawer.dart';
import 'package:tecpos/pages/Login/login_popup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PosAppBar(
        rootTitle: 'Login',
      ),
      drawer: const PosDrawer(),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/logo-banner.svg',
                semanticsLabel: 'TecBased',
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: Text(
                  tr('screens.login.popUp.buttonText'),
                ),
                onPressed: () async {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          tr('screens.login.popUp.buttonText'),
                          textAlign: TextAlign.center,
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/svgs/worker.svg',
                                    width: 128,
                                    height: 128,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const LoginPopUp(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
