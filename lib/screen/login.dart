import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rivierpord_loginsignup/providers/login_provider.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProvider = ref.watch(loginProviderProvider);
    final provider = ref.read(loginProviderProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              // onChanged: (value) =>
              //     ref.read(loginProviderProvider.notifier).setEmail(),
              controller: provider.emailController,
            ),
            TextField(
              //onChanged: (value) =>
              //    ref.read(loginProviderProvider.notifier).setPassword(),
              controller: provider.passwordController,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(loginProviderProvider.notifier).login();
                },
                child: Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}
