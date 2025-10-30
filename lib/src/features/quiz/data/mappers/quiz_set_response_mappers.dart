import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/question_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_response_model/quiz_set_response_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response/quiz_set_response.dart';

class QuizSetResponseMapper implements Mapper<QuizSetResponse, QuizSetResponseModel> {
  final QuestionMapper _questionMapper = QuestionMapper();

  @override
  QuizSetResponseModel toModel(QuizSetResponse entity) {
    return QuizSetResponseModel(
      quizSetId: entity.quizSetId,
      questions: entity.questions.map(_questionMapper.toModel).toList(),
      totalQuestions: entity.totalQuestions,
    );
  }

  @override
  QuizSetResponse fromModel(QuizSetResponseModel model) {
    return QuizSetResponse(
      quizSetId: model.quizSetId,
      questions: model.questions.map(_questionMapper.fromModel).toList(),
      totalQuestions: model.totalQuestions,
    );
  }
}
