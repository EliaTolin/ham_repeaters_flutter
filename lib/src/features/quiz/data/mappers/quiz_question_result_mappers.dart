import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_question_result_model/quiz_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_question_result/quiz_question_result.dart';

class QuizQuestionResultMapper {
  QuizQuestionResult fromModel(QuizQuestionResultModel model) {
    return QuizQuestionResult(
      setId: model.setId,
      questionId: model.questionId,
      chosenLetter: model.chosenLetter,
      answeredAt: model.answeredAt != null ? DateTime.parse(model.answeredAt!) : null,
      timeMs: model.timeMs,
      topicName: model.topicName,
      exam: model.exam,
      correctLetter: model.correctLetter,
      isCorrect: model.isCorrect,
    );
  }
}
