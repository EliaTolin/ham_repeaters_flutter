import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_result_model/quiz_set_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_question_result/quiz_set_question_result.dart';

class QuizSetQuestionResultMapper
    implements Mapper<QuizSetQuestionResult, QuizSetQuestionResultModel> {
  @override
  QuizSetQuestionResultModel toModel(QuizSetQuestionResult entity) {
    throw UnimplementedError();
  }

  @override
  QuizSetQuestionResult fromModel(QuizSetQuestionResultModel model) {
    return QuizSetQuestionResult(
      setId: model.setId,
      questionId: model.questionId,
      topicName: model.topicName,
      exam: ExamType.fromString(model.exam),
      correctLetter: model.correctLetter,
      isCorrect: model.isCorrect,
      chosenLetter: model.chosenLetter,
      answeredAt: model.answeredAt,
      timeMs: model.timeMs,
      chosenAnswer: model.chosenAnswer,
      correctAnswer: model.correctAnswer,
      questionText: model.questionText,
    );
  }
}
