import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors/app_colors.dart';

class ScoreTexts extends StatelessWidget {
  final int totalBall;
  final int maxBall;
  final int totalQuestions;

  const ScoreTexts({
    super.key,
    required this.totalBall,
    required this.maxBall,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Yakunlandi",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          "Sizga $totalBall ball taqdim etildi",
          style: TextStyle(fontSize: 16.sp, color: Colors.black54),
        ),
        Text(
          "To‘plagan ballaringiz: $totalBall ",
          style: TextStyle(fontSize: 16.sp, color: Colors.black54),
        ),
        SizedBox(height: 16.h),
        Text(
          "Umumiy testlar soni: $totalQuestions",
          style: TextStyle(fontSize: 16.sp, color: Colors.black54),
        ),
      ],
    );
  }
}
