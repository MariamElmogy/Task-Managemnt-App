import 'package:flutter/material.dart';
import 'package:task_manager_app/features/login/presentation/views/widgets/login_form.dart';
import 'package:task_manager_app/core/utils/styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: Styles.fontSizeBold30,
            textAlign: TextAlign.center,
          ),
          const LoginForm(),
        ],
      ),
    );
  }
}
