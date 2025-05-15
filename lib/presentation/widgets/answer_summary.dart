import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors/app_colors.dart';

class AnswerSummary extends StatelessWidget {
  final int correct;
  final int wrong;

  const AnswerSummary({
    super.key,
    required this.correct,
    required this.wrong,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                Text(
                  "$correct",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                  ),
                ),
                Text(
                  "To'g'ri javob",
                  style: TextStyle(fontSize: 14.sp, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                Text(
                  "$wrong",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Noto'g'ri javob",
                  style: TextStyle(fontSize: 14.sp, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
