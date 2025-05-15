import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/theme/colors/app_colors.dart';
import 'package:quiz_app/presentation/widgets/quiz_result_widget.dart';
import '../../logic/bloc/quiz_bloc.dart';
import '../../logic/bloc/quiz_event.dart';
import '../../logic/bloc/quiz_state.dart';
import '../widgets/quiz_in_progress_widget.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(QuizStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizInProgress) {
              return QuizInProgressWidget(state: state);
            } else if (state is QuizFinished) {
              return QuizResultWidget(state: state,);
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
