import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/utils/app_colors.dart';
import 'package:task_manager_app/core/widgets/custom_button.dart';
import 'package:task_manager_app/core/widgets/custom_text_form_field.dart';
import 'package:task_manager_app/features/login/data/models/user_model.dart';
import 'package:task_manager_app/features/login/presentation/manager/login_cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: usernameController,
            hintText: 'Username',
            icon: const Icon(Icons.person),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'Password',
            icon: const Icon(Icons.lock),
          ),
          const SizedBox(height: 16),
          CustomButton(
            color: AppColors.purplePlum,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                BlocProvider.of<LoginCubit>(context).login(
                  userModel: UserModel(
                    username: usernameController.text,
                    password: passwordController.text,
                  ),
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            title: 'Log in',
          ),
        ],
      ),
    );
  }
}
