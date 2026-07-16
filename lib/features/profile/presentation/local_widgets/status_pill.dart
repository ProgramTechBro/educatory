import 'package:flutter/material.dart';
import '../../../../config/app_typography.dart';

class StatusPill extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color? contentColor;
  final IconData? leadingIcon;
  final bool showChevron;

  const StatusPill({
    super.key,
    required this.label,
    required this.borderColor,
    this.contentColor,
    this.leadingIcon,
    this.showChevron = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = contentColor ?? borderColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 16, color: content),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTypography.bodyLargeRegular.copyWith(color: content),
          ),
          if (showChevron) ...[
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, size: 12, color: content),
          ],
        ],
      ),
    );
  }
}
