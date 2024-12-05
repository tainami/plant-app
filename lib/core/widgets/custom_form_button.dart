import 'package:flutter/material.dart';
import 'package:plant/core/themes/app_colors.dart'; // Importe a cor AppColors

class CustomFormButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomFormButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.green),
        minimumSize: WidgetStateProperty.all(const Size(400, 50)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
