import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_question.dart';

class QuizSetQuestionMapper implements Mapper<QuizSetQuestion, QuizSetQuestionModel> {
  @override
  QuizSetQuestionModel toModel(QuizSetQuestion entity) {
    return QuizSetQuestionModel(
      setId: entity.setId,
      questionId: entity.questionId,
      chosenLetter: entity.chosenLetter,
      answeredAt: entity.answeredAt?.toIso8601String(),
      timeMs: entity.timeMs,
    );
  }

  @override
  QuizSetQuestion fromModel(QuizSetQuestionModel model) {
    return QuizSetQuestion(
      setId: model.setId,
      questionId: model.questionId,
      chosenLetter: model.chosenLetter,
      answeredAt: model.answeredAt != null ? DateTime.parse(model.answeredAt!) : null,
      timeMs: model.timeMs,
    );
  }
}
