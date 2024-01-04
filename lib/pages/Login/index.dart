import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'login_popup.dart'; // Import the LoginPopUp

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isValidLogin = useState(true); // State to track login validity

    void handleLoginStatusChanged(bool success) {
      isValidLogin.value = success; // Update state based on login status
    }

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for logo or other elements
            Text('Welcome to the Login Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Login'),
                    content: LoginPopUp(
                      onLoginStatusChanged: handleLoginStatusChanged,
                    ),
                  ),
                );
              },
              child: const Text('Show Login'),
            ),
            // Additional UI based on login status
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: isValidLogin.value ? Colors.green : Colors.red,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Text(
                isValidLogin.value ? 'Login Valid' : 'Invalid Login',
                style: TextStyle(
                  color: isValidLogin.value ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
