import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rivierpord_loginsignup/auth/presentation/providers/login_provider.dart';


class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProvider = ref.watch(loginProviderProvider);
    final provider = ref.read(loginProviderProvider.notifier);


    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Total data length = ${provider.list.length}"),

            TextField(
              // onChanged: (value) =>
              //     ref.read(loginProviderProvider.notifier).setEmail(),
              controller: provider.emailController,
              decoration: const InputDecoration(
                hintText: "Enter email here",
                label: Text("Email"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter password here",
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
              //onChanged: (value) =>
              //    ref.read(loginProviderProvider.notifier).setPassword(),
              controller: provider.passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                minimumSize: const Size(88, 54),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                ref.read(loginProviderProvider.notifier).signUp();
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 54.0, right: 54),
                child: Text('Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

