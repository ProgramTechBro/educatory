import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class PhoneNumberField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String initialCountryCode;

  const PhoneNumberField({
    super.key,
    required this.onChanged,
    this.initialCountryCode = 'US',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Number',
          style: AppTypography.bodyLargeMedium.copyWith(
            color: AppColors.neutral900,
          ),
        ),
        const SizedBox(height: 6),
        IntlPhoneField(
          initialCountryCode: initialCountryCode,
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
          dropdownTextStyle: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
          flagsButtonPadding: const EdgeInsets.only(left: 12),
          dropdownIconPosition: IconPosition.trailing,
          showDropdownIcon: true,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.white,
            hintText: '555-0113',
            hintStyle: AppTypography.bodyLargeRegular.copyWith(
              color: AppColors.neutral500,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.neutral300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.neutral300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
          onChanged: (phone) => onChanged(phone.completeNumber),
        ),
      ],
    );
  }
}
