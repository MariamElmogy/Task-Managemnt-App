import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.controller,
  });

  final String hintText;
  final Icon? icon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.darkGrey,
          fontSize: 14,
        ),
        prefixIcon: icon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            color: AppColors.lilacPetals,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            color: AppColors.lilacPetals,
          ),
        ),
        fillColor: AppColors.lilacPetalsDark,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${hintText.toLowerCase()}';
        }
        return null;
      },
    );
  }
}
