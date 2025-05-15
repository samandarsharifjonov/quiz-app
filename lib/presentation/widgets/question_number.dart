import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/logic/bloc/quiz_state.dart';

import '../../core/theme/colors/app_colors.dart';
import '../../logic/bloc/quiz_bloc.dart';
import '../../logic/bloc/quiz_event.dart';

class QuestionNumbers extends StatefulWidget {
  QuizInProgress state;
   QuestionNumbers({super.key, required this.state});

  @override
  State<QuestionNumbers> createState() => _QuestionNumbersState();
}

class _QuestionNumbersState extends State<QuestionNumbers> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.state.questions.length,
        itemBuilder: (context, index) {
          final isCurrentQuestion = index == widget.state.currentQuestionIndex;
          final hasAnswer = widget.state.userAnswers.containsKey(index);
          final isCorrect = hasAnswer &&
              widget.state.userAnswers[index] == widget.state.questions[index].correctAnswerIndex;

          Color backgroundColor;
          if (hasAnswer) {
            backgroundColor = isCorrect ? AppColors.greenSuccess : AppColors.errorColor;
          } else {
            backgroundColor = isCurrentQuestion ? AppColors.green : AppColors.white;
          }

          return Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              children: [
                if (isCurrentQuestion)
                  SvgPicture.asset("asset/icons/arrow_bottom.svg"),
                SizedBox(
                  height: 12.h,
                ),
                //SizedBox(height: 16.h), // For alignment
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.read<QuizBloc>().add(
                      QuizNavigateToQuestion(questionIndex: index),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: backgroundColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: isCurrentQuestion ? AppColors.white : AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
