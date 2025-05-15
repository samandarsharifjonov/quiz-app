import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/colors/app_colors.dart';
import '../../../logic/bloc/quiz_bloc.dart';
import '../../../logic/bloc/quiz_event.dart';
import '../../../logic/bloc/quiz_state.dart';

class AnswerOptionWidget extends StatelessWidget {
  final QuizInProgress state;
  final int answerIndex;
  final String answerText;
  final int correctAnswerIndex;

  const AnswerOptionWidget({
    super.key,
    required this.state,
    required this.answerIndex,
    required this.answerText,
    required this.correctAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    final currentQuestionIndex = state.currentQuestionIndex;
    final userAnswerIndex = state.userAnswers[currentQuestionIndex];
    String optionLetter = String.fromCharCode(65 + answerIndex);

    Color containerColor = AppColors.white;
    Color textColor = AppColors.textColor;
    Color optionTextColor = AppColors.blueGen;

    if (userAnswerIndex != null) {
      if (answerIndex == correctAnswerIndex) {
        containerColor = AppColors.greenSuccess;
        textColor = AppColors.white;
        optionTextColor = AppColors.white;
      } else if (answerIndex == userAnswerIndex) {
        containerColor = AppColors.errorColor;
        textColor = AppColors.white;
        optionTextColor = AppColors.white;
      }
    }


    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: userAnswerIndex == null
            ? () {
          context.read<QuizBloc>().add(
            QuizAnswerSelected(
              questionIndex: currentQuestionIndex,
              answerIndex: answerIndex,
            ),
          );
        }
            : null,
        child: Container(
          width: 354.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: containerColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 24.h, left: 18.w),
            child: Row(
              children: [
                Text(
                  optionLetter,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: optionTextColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    answerText,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
