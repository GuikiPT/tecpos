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
  final TextEditingController _passwordController = TextEditingController();
  late TextEditingController _activeController;

  late final FocusNode _usernameFocusNode = FocusNode();
  late final FocusNode _passwordFocusNode = FocusNode();
  late FocusNode _activeFocusInput;

  @override
  void initState() {
    super.initState();
    _activeController = _usernameController;
    _activeFocusInput = _usernameFocusNode;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _usernameFocusNode.dispose();

    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _usernameController,
          onTap: () {
            _activeController = _usernameController;
            _usernameFocusNode.requestFocus();
            _activeFocusInput = _usernameFocusNode;
          },
          focusNode: _usernameFocusNode,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            labelText: tr('screens.login.popUp.user'),
            labelStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _passwordController,
          onTap: () {
            _activeController = _passwordController;
            _passwordFocusNode.requestFocus();
            _activeFocusInput = _passwordFocusNode;
          },
          focusNode: _passwordFocusNode,
          obscureText: true,
          keyboardType: TextInputType.none,
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
              if (_activeController.text.isNotEmpty) {
                final newText = _activeController.text
                    .substring(0, _activeController.text.length - 1);
                _activeController.text = newText;
              }
            } else if (button == 'ClearAll') {
              _activeController.text = '';
            } else if (button == 'Done') {
              // Handle done logic here
            } else {
              _activeController.text += button;
            }

            _activeFocusInput.requestFocus();
          },
        ),
      ],
    );
  }
}
