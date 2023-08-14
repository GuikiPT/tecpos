import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tecpos/components/numpad.dart';

class LoginPopUp extends StatefulWidget {
  const LoginPopUp({super.key});

  @override
  LoginPopUpState createState() => LoginPopUpState();
}

class LoginPopUpState extends State<LoginPopUp> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _usernameController,
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
        POSNumpad(
          onButtonPressed: (button) {
            if (button == 'Clear') {
              if (_usernameController.text.isNotEmpty) {
                final newText = _usernameController.text
                    .substring(0, _usernameController.text.length - 1);
                _usernameController.text = newText;
              }
            } else if (button == 'ClearAll') {
              _usernameController.text = '';
            } else if (button == 'Done') {
              // Handle done logic here
            } else {
              _usernameController.text += button;
            }
          },
        ),
      ],
    );
  }
}
