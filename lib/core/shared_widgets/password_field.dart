import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import 'app_text_field.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: widget.label,
      hint: widget.hint,
      controller: widget.controller,
      obscureText: _obscure,
      prefixIcon: const Icon(
        Icons.lock_outline,
        size: 20,
        color: AppColors.neutral500,
      ),
      suffixIcon: InkWell(
        onTap: () => setState(() => _obscure = !_obscure),
        child: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 20,
          color: AppColors.neutral500,
        ),
      ),
    );
  }
}
