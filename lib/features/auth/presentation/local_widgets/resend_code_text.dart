import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ResendCodeText extends StatefulWidget {
  final int seconds;

  const ResendCodeText({super.key, this.seconds = 39});

  @override
  State<ResendCodeText> createState() => _ResendCodeTextState();
}

class _ResendCodeTextState extends State<ResendCodeText> {
  late int _secondsLeft = widget.seconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
        return;
      }
      setState(() => _secondsLeft--);
    });
  }

  void _resend() {
    setState(() => _secondsLeft = widget.seconds);
    _timer?.cancel();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        AppTypography.bodyLargeRegular.copyWith(color: AppColors.neutral500);
    final linkStyle =
        AppTypography.bodyLargeMedium.copyWith(color: AppColors.primary);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: baseStyle,
        children: [
          const TextSpan(text: "Didn't receive the code? "),
          if (_secondsLeft == 0)
            TextSpan(
              text: 'Resend',
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = _resend,
            )
          else ...[
            TextSpan(text: 'Resend', style: linkStyle),
            TextSpan(text: ' in $_secondsLeft second'),
          ],
        ],
      ),
    );
  }
}
