import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_score_model/quiz_set_score_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';

class QuizSetScoreMapper {
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
