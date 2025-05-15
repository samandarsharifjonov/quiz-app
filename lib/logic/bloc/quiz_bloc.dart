import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quiz_app/logic/bloc/quiz_event.dart';
import 'package:quiz_app/logic/bloc/quiz_state.dart';

import '../../data/questions/questions.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final int quizDurationSeconds = 120;
  Timer? _timer;

  QuizBloc() : super(QuizInitial()) {
    on<QuizStarted>(_onQuizStarted);
    on<QuizAnswerSelected>(_onQuizAnswerSelected);
    on<QuizNextQuestion>(_onQuizNextQuestion);
    on<QuizPreviousQuestion>(_onQuizPreviousQuestion);
    on<QuizNavigateToQuestion>(_onQuizNavigateToQuestion);
    on<QuizTimerTick>(_onQuizTimerTick);
  }

  void _onQuizStarted(QuizStarted event, Emitter<QuizState> emit) {
    _startTimer();

    emit(QuizInProgress(
      questions: quizQuestions,
      currentQuestionIndex: 0,
      userAnswers: {},
      remainingSeconds: quizDurationSeconds,
    ));
  }

  void _onQuizAnswerSelected(QuizAnswerSelected event, Emitter<QuizState> emit) {
    final currentState = state;

    if (currentState is QuizInProgress) {
      final updatedUserAnswers = Map<int, int?>.from(currentState.userAnswers);
      updatedUserAnswers[event.questionIndex] = event.answerIndex;

      emit(currentState.copyWith(userAnswers: updatedUserAnswers));
      if (updatedUserAnswers.length == currentState.questions.length) {
        _checkIfCompleted(emit, currentState.copyWith(userAnswers: updatedUserAnswers));
      }
    }
  }

  void _onQuizNextQuestion(QuizNextQuestion event, Emitter<QuizState> emit) {
    final currentState = state;
    if (currentState is QuizInProgress) {
      final nextIndex = (currentState.currentQuestionIndex + 1) % currentState.questions.length;
      emit(currentState.copyWith(currentQuestionIndex: nextIndex));
    }
  }

  void _onQuizPreviousQuestion(QuizPreviousQuestion event, Emitter<QuizState> emit) {
    final currentState = state;

    if (currentState is QuizInProgress) {
      final prevIndex = currentState.currentQuestionIndex > 0
          ? currentState.currentQuestionIndex - 1
          : currentState.questions.length - 1;

      emit(currentState.copyWith(currentQuestionIndex: prevIndex));
    }
  }

  void _onQuizNavigateToQuestion(QuizNavigateToQuestion event, Emitter<QuizState> emit) {
    final currentState = state;

    if (currentState is QuizInProgress) {
      if (event.questionIndex >= 0 && event.questionIndex < currentState.questions.length) {
        emit(currentState.copyWith(currentQuestionIndex: event.questionIndex));
      }
    }
  }

  void _onQuizTimerTick(QuizTimerTick event, Emitter<QuizState> emit) {
    final currentState = state;

    if (currentState is QuizInProgress) {
      if (event.remainingSeconds <= 0) {
        _timer?.cancel();
        _checkIfCompleted(emit, currentState.copyWith(remainingSeconds: 0, isCompleted: true));
      } else {
        emit(currentState.copyWith(remainingSeconds: event.remainingSeconds));
      }
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        final currentState = state;
        if (currentState is QuizInProgress) {
          final remainingSeconds = currentState.remainingSeconds - 1;
          add(QuizTimerTick(remainingSeconds: remainingSeconds));
        } else {
          timer.cancel();
        }
      },
    );
  }

  void _checkIfCompleted(Emitter<QuizState> emit, QuizInProgress currentState) {
    if (currentState.isCompleted || currentState.userAnswers.length == currentState.questions.length) {
      _timer?.cancel();

      int score = 0;
      currentState.userAnswers.forEach((questionIndex, answerIndex) {
        if (answerIndex == currentState.questions[questionIndex].correctAnswerIndex) {
          score++;
        }
      });

      emit(QuizFinished(
        score: score,
        totalQuestions: currentState.questions.length,
      ));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}