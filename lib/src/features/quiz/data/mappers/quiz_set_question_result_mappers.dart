import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_question_result.dart';

class QuizSetQuestionResultMapper
    implements Mapper<QuizSetQuestionResult, QuizSetQuestionResultModel> {
  @override
  QuizSetQuestionResultModel toModel(QuizSetQuestionResult entity) {
    return QuizSetQuestionResultModel(
      setId: entity.setId,
      questionId: entity.questionId,
      topicName: entity.topicName,
      exam: entity.exam,
      correctLetter: entity.correctLetter,
      isCorrect: entity.isCorrect,
      chosenLetter: entity.chosenLetter,
      answeredAt: entity.answeredAt?.toIso8601String(),
      timeMs: entity.timeMs,
    );
  }

  @override
  QuizSetQuestionResult fromModel(QuizSetQuestionResultModel model) {
    return QuizSetQuestionResult(
      setId: model.setId,
      questionId: model.questionId,
      topicName: model.topicName,
      exam: model.exam,
      correctLetter: model.correctLetter,
      isCorrect: model.isCorrect,
      chosenLetter: model.chosenLetter,
      answeredAt: model.answeredAt != null ? DateTime.parse(model.answeredAt!) : null,
      timeMs: model.timeMs,
    );
  }
}
