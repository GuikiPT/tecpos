import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpos/components/numpad.dart';

class LoginPopUp extends HookWidget {
  final Function(bool) onLoginStatusChanged;

  const LoginPopUp({Key? key, required this.onLoginStatusChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    TextEditingController activeController = usernameController;
    FocusNode activeFocusInput = usernameFocusNode;

    final obscurePasswordProtection = useState(true);

    final formKey = GlobalKey<FormBuilderState>();
    final loginError = useState<String?>(null);

    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'username',
            controller: usernameController,
            onTap: () {
              activeController = usernameController;
              activeFocusInput = usernameFocusNode;
              usernameFocusNode.requestFocus();
            },
            focusNode: usernameFocusNode,
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
              labelText: tr('screens.login.popUp.user'),
              labelStyle: Theme.of(context).textTheme.bodySmall,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.numeric(),
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          FormBuilderTextField(
            name: 'password',
            controller: passwordController,
            onTap: () {
              activeController = passwordController;
              activeFocusInput = passwordFocusNode;
              passwordFocusNode.requestFocus();
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
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.numeric(),
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          if (loginError.value != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  loginError.value!,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
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
                final formValid = formKey.currentState?.saveAndValidate();

                if (formValid == false) {
                  return formKey.currentState?.saveAndValidate();
                } else if (usernameController.text == '123' &&
                    passwordController.text == '123') {
                  loginError.value = null;
                  onLoginStatusChanged(true);
                  context.go('/home');
                } else {
                  onLoginStatusChanged(false);
                  loginError.value =
                      tr('screens.login.popUp.incorrectCredentials');
                }
              } else {
                activeController.text += button;
              }
              if (activeFocusInput.hasFocus) {
                activeFocusInput.unfocus();
                Future.delayed(
                  Duration.zero,
                  () => activeFocusInput.requestFocus(),
                );
              } else {
                activeFocusInput.requestFocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
