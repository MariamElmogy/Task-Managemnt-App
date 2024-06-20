import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/app_colors.dart';

class CustomExitAppBar extends StatelessWidget {
  const CustomExitAppBar({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.lilacPetalsDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.cancel_outlined),
        ),
      ),
    );
  }
}
