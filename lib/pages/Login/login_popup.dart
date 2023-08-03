import 'package:flutter/material.dart';

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
            labelText: 'User',
            labelStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
