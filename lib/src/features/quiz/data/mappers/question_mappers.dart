import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/question_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/question.dart';

class QuestionMapper implements Mapper<Question, QuestionModel> {
  @override
  QuestionModel toModel(Question entity) {
    return QuestionModel(
      id: entity.id,
      questionText: entity.questionText,
      topicName: entity.topicName,
      exam: entity.exam.value,
      answerA: entity.answerA,
      answerB: entity.answerB,
      answerC: entity.answerC,
      correctLetter: entity.correctLetter,
      correctAnswer: entity.correctAnswer,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
      explanation: entity.explanation,
      sourceRef: entity.sourceRef,
    );
  }

  @override
  Question fromModel(QuestionModel model) {
    return Question(
      id: model.id,
      questionText: model.questionText,
      topicName: model.topicName,
      exam: ExamType.fromString(model.exam),
      answerA: model.answerA,
      answerB: model.answerB,
      answerC: model.answerC,
      correctLetter: model.correctLetter,
      correctAnswer: model.correctAnswer,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
      explanation: model.explanation,
      sourceRef: model.sourceRef,
    );
  }
}
