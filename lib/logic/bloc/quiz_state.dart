import 'package:equatable/equatable.dart';

import '../../data/models/quiz_model.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizInProgress extends QuizState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final Map<int, int?> userAnswers;
  final int remainingSeconds;
  final bool isCompleted;

  const QuizInProgress({
    required this.questions,
    required this.currentQuestionIndex,
    required this.userAnswers,
    required this.remainingSeconds,
    this.isCompleted = false,
  });

  QuizInProgress copyWith({
    List<Question>? questions,
    int? currentQuestionIndex,
    Map<int, int?>? userAnswers,
    int? remainingSeconds,
    bool? isCompleted,
  }) {
    return QuizInProgress(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      userAnswers: userAnswers ?? this.userAnswers,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object> get props => [questions, currentQuestionIndex, userAnswers, remainingSeconds, isCompleted];
}

class QuizFinished extends QuizState {
  final int score;
  final int totalQuestions;


  const QuizFinished( {
    required this.score,
    required this.totalQuestions,


  });

  @override
  List<Object> get props => [score, totalQuestions];
}
