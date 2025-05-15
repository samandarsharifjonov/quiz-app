import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/logic/bloc/quiz_state.dart';

import '../../core/theme/colors/app_colors.dart';
import '../../logic/bloc/quiz_bloc.dart';
import '../../logic/bloc/quiz_event.dart';

class NavigationControls extends StatelessWidget {
  final QuizInProgress state;
  const NavigationControls({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<QuizBloc>().add(QuizPreviousQuestion());
          },
          child: SvgPicture.asset("asset/icons/arrow_left.svg"),
        ),
        Text(
          "${state.currentQuestionIndex + 1}/${state.questions.length}",
          style: TextStyle(
            color: AppColors.dark2,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<QuizBloc>().add(QuizNextQuestion());
          },
          child: SvgPicture.asset("asset/icons/arrow_right.svg"),
        ),
      ],
    );
  }
}
