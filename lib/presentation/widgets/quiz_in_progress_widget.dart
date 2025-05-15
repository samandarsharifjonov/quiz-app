import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/presentation/widgets/build_top_bar.dart';
import 'package:quiz_app/presentation/widgets/navigation_controls.dart';
import 'package:quiz_app/presentation/widgets/question_card.dart';
import 'package:quiz_app/presentation/widgets/question_number.dart';
import '../../../core/theme/colors/app_colors.dart';
import '../../../logic/bloc/quiz_state.dart';
import 'answer_option_widget.dart';

class QuizInProgressWidget extends StatelessWidget {
  final QuizInProgress state;

  const QuizInProgressWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final question = state.questions[state.currentQuestionIndex];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Column(
          children: [
            BuildTopBar(state: state),
            SizedBox(height: 38.h),
            QuestionNumbers(state: state),
            SizedBox(height: 24.h),
            QuestionCard(questionText: question.text),
            SizedBox(height: 12.h),
            Row(
              children: [
                Text(
                  "Javoblar",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            ...List.generate(
              question.options.length,
                  (index) => AnswerOptionWidget(
                state: state,
                answerIndex: index,
                answerText: question.options[index],
                correctAnswerIndex: question.correctAnswerIndex,
              ),
            ),
            SizedBox(height: 12.h),
            NavigationControls(state: state),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
