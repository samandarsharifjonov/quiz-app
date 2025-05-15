import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/logic/bloc/quiz_state.dart';

import '../../core/theme/colors/app_colors.dart';

class BuildTopBar extends StatelessWidget {
  QuizInProgress state;
  BuildTopBar({super.key, required this.state});

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 18.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("asset/icons/logout.svg"),
            SvgPicture.asset("asset/icons/sms.svg"),
            SvgPicture.asset("asset/icons/moon.svg"),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.r),
                color: AppColors.bgColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.h),
                child: Row(
                  children: [
                    SvgPicture.asset("asset/icons/timmer.svg"),
                    SizedBox(width: 3.w),
                    Text(
                      formatTime(state.remainingSeconds),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
