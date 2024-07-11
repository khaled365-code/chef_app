

import 'package:flutter/material.dart';

import '../widgets/login_body.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E2E),
      body: SafeArea(
          child: Stack(
            children: [
              LoginHeader(
                context: context,
              ),
              Builder(
                builder: (context) {
                  return Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: LoginBody(
                      context: context,
                    ),
                  );
                }
              )

            ],)),
    );
  }
}
