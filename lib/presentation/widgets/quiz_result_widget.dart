import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/presentation/widgets/percentage_circle.dart';
import 'package:quiz_app/presentation/widgets/retry_button.dart';
import 'package:quiz_app/presentation/widgets/score_texts.dart';
import 'package:quiz_app/presentation/widgets/timer_row.dart';
import '../../logic/bloc/quiz_bloc.dart';
import '../../logic/bloc/quiz_event.dart';
import '../../logic/bloc/quiz_state.dart';
import 'answer_summary.dart';


class QuizResultWidget extends StatelessWidget {
  final QuizFinished state;

  const QuizResultWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final correctAnswers = state.score;
    final wrongAnswers = state.totalQuestions - state.score;
    final totalBall = correctAnswers * 5;
    final maxBall = state.totalQuestions * 5;
    final percentage = (state.score / state.totalQuestions * 100).toInt();

    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PercentageCircle(
              percentage: percentage,
              correct: state.score,
              total: state.totalQuestions,
            ),
            SizedBox(height: 20.h),
            ScoreTexts(
              totalBall: totalBall,
              maxBall: maxBall,
              totalQuestions: state.totalQuestions,
            ),
            SizedBox(height: 24.h),
            AnswerSummary(
              correct: correctAnswers,
              wrong: wrongAnswers,
            ),
            SizedBox(height: 24.h),
            const TimerRow(),
            SizedBox(height: 24.h),
            RetryButton(
              onPressed: () {
                context.read<QuizBloc>().add(QuizStarted());
              },
            ),
          ],
        ),
      ),
    );
  }
}
