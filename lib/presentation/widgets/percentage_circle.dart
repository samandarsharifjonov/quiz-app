import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors/app_colors.dart';

class PercentageCircle extends StatelessWidget {
  final int percentage;
  final int correct;
  final int total;

  const PercentageCircle({
    super.key,
    required this.percentage,
    required this.correct,
    required this.total,
  });

  Color _getScoreColor(int score, int totalQuestions) {
    final percent = score / totalQuestions;
    if (percent >= 0.8) return AppColors.greenSuccess;
    if (percent >= 0.6) return AppColors.green;
    if (percent >= 0.4) return AppColors.orange;
    return AppColors.errorColor;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getScoreColor(correct, total);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120.w,
          height: 120.h,
          child: CircularProgressIndicator(
            value: correct / total,
            strokeWidth: 10.w,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        Text(
          "$percentage%",
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
