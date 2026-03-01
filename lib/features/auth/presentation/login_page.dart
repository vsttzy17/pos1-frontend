import 'package:flutter/material.dart';
import '../data/auth_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // void handleLogin() async {
  //   var response = await AuthApi.login(
  //     usernameController.text,
  //     passwordController.text,
  //   );

  //   if (response != null) {
  //     print("SUCCESS: ${response.data}");
  //   } else {
  //     print("FAILED LOGIN");
  //   }
  // }

  void handleLogin() async {
    bool success = await AuthApi.login(
      usernameController.text,
      passwordController.text,
    );

    if (success) {
      print("TOKEN SAVED");
    } else {
      print("FAILED LOGIN");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              // obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}