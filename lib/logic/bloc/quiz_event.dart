import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class QuizStarted extends QuizEvent {}

class QuizAnswerSelected extends QuizEvent {
  final int questionIndex;
  final int answerIndex;

  const QuizAnswerSelected({
    required this.questionIndex,
    required this.answerIndex,
  });

  @override
  List<Object> get props => [questionIndex, answerIndex];
}

class QuizNextQuestion extends QuizEvent {}

class QuizPreviousQuestion extends QuizEvent {}

class QuizNavigateToQuestion extends QuizEvent {
  final int questionIndex;

  const QuizNavigateToQuestion({required this.questionIndex});

  @override
  List<Object> get props => [questionIndex];
}

class QuizTimerTick extends QuizEvent {
  final int remainingSeconds;

  const QuizTimerTick({required this.remainingSeconds});

  @override
  List<Object> get props => [remainingSeconds];
}
