import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rivierpord_loginsignup/auth/presentation/screen/signup.dart';

import '../providers/login_provider.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProvider = ref.watch(loginProviderProvider);
    final provider = ref.read(loginProviderProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 30, top: 20, bottom: 20),
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
                ref.read(loginProviderProvider.notifier).login();
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 54.0, right: 54),
                child: Text('Login'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: 'Signup',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       ref.read(loginProviderProvider.notifier).signUp();
            //     },
            //     child: const Text("Get All login data"))
          ],
        ),
      ),
    );
  }
}
