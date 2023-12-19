import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tecpos/components/numpad.dart';

class LoginPopUp extends HookWidget {
  const LoginPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    late TextEditingController activeController;
    late FocusNode activeFocusInput;

    final obscurePasswordProtection = useState(true);

    useEffect(() {
      activeController = usernameController;
      activeFocusInput = usernameFocusNode;

      return () {};
    }, []);

    return Column(
      children: [
        TextFormField(
          controller: usernameController,
          onTap: () {
            activeController = usernameController;
            usernameFocusNode.requestFocus();
            activeFocusInput = usernameFocusNode;
          },
          focusNode: usernameFocusNode,
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
          controller: passwordController,
          onTap: () {
            activeController = passwordController;
            passwordFocusNode.requestFocus();
            activeFocusInput = passwordFocusNode;
          },
          focusNode: passwordFocusNode,
          obscureText: obscurePasswordProtection.value,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            labelText: tr('screens.login.popUp.password'),
            labelStyle: Theme.of(context).textTheme.bodySmall,
            suffixIcon: IconButton(
              icon: Icon(obscurePasswordProtection.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility),
              onPressed: () {
                obscurePasswordProtection.value =
                    !obscurePasswordProtection.value;
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        POSNumpad(
          onButtonPressed: (button) {
            if (button == 'Clear') {
              if (activeController.text.isNotEmpty) {
                final newText = activeController.text
                    .substring(0, activeController.text.length - 1);
                activeController.text = newText;
              }
            } else if (button == 'ClearAll') {
              activeController.text = '';
            } else if (button == 'Done') {
              // Handle done logic here
            } else {
              activeController.text += button;
            }

            activeFocusInput.requestFocus();
          },
        ),
      ],
    );
  }
}
