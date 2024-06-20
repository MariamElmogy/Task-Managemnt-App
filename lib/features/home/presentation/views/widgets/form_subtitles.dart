import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/styles.dart';

class FormSubTitles extends StatelessWidget {
  const FormSubTitles({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styles.fontSizeBold16,
    );
  }
}
