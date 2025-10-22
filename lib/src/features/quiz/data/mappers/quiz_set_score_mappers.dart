import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_score_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class QuizSetScoreMapper implements Mapper<QuizSetScore, QuizSetScoreModel> {
  @override
  QuizSetScoreModel toModel(QuizSetScore entity) {
    return QuizSetScoreModel(
      setId: entity.setId,
      userId: entity.userId,
      mode: entity.mode,
      answered: entity.answered,
      correct: entity.correct,
      wrong: entity.wrong,
      total: entity.total,
      accuracyPct: entity.accuracyPct,
      exam: entity.exam,
      customTopics: entity.customTopics,
    );
  }

  @override
  QuizSetScore fromModel(QuizSetScoreModel model) {
    return QuizSetScore(
      setId: model.setId,
      userId: model.userId,
      mode: model.mode,
      answered: model.answered,
      correct: model.correct,
      wrong: model.wrong,
      total: model.total,
      accuracyPct: model.accuracyPct,
      exam: model.exam,
      customTopics: model.customTopics,
    );
  }
}
