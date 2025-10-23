import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_answers_datasource.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_model.dart';

abstract class QuizAnswersRepository {
  Future<void> saveAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  });

  Future<void> updateAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  });

  Future<void> deleteAnswer({
    required String setId,
    required int questionId,
  });

  Future<List<QuizSetQuestionModel>> getAnswers(String setId);

  Future<void> deleteQuizAnswers(String setId);
}

class QuizAnswersRepositoryImpl implements QuizAnswersRepository {
  QuizAnswersRepositoryImpl(this._dataSource);
  final QuizAnswersDataSource _dataSource;

  @override
  Future<void> saveAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  }) async {
    return _dataSource.saveAnswer(
      setId: setId,
      questionId: questionId,
      chosenLetter: chosenLetter,
      timeMs: timeMs,
    );
  }

  @override
  Future<void> updateAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  }) async {
    return _dataSource.updateAnswer(
      setId: setId,
      questionId: questionId,
      chosenLetter: chosenLetter,
      timeMs: timeMs,
    );
  }

  @override
  Future<void> deleteAnswer({
    required String setId,
    required int questionId,
  }) async {
    return _dataSource.deleteAnswer(
      setId: setId,
      questionId: questionId,
    );
  }

  @override
  Future<List<QuizSetQuestionModel>> getAnswers(String setId) async {
    return _dataSource.getAnswers(setId);
  }

  @override
  Future<void> deleteQuizAnswers(String setId) async {
    return _dataSource.deleteQuizAnswers(setId);
  }
}
