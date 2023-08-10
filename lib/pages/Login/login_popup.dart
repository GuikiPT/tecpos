import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tecpos/components/numpad.dart';

class LoginPopUp extends StatelessWidget {
  const LoginPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: tr('screens.login.popUp.user'),
            labelStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: tr('screens.login.popUp.password'),
            labelStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const POSNumpad(),
      ],
    );
  }
}
