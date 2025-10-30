import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_model/quiz_set_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set/quiz_set.dart';

class QuizSetMapper implements Mapper<QuizSet, QuizSetModel> {
  @override
  QuizSetModel toModel(QuizSet entity) {
    return QuizSetModel(
      id: entity.id,
      userId: entity.userId,
      startedAt: entity.startedAt.toIso8601String(),
      exam: entity.exam,
      customTopics: entity.customTopics,
      finishedAt: entity.finishedAt?.toIso8601String(),
    );
  }

  @override
  QuizSet fromModel(QuizSetModel model) {
    return QuizSet(
      id: model.id,
      userId: model.userId,
      startedAt: DateTime.parse(model.startedAt),
      exam: model.exam,
      customTopics: model.customTopics,
      finishedAt: model.finishedAt != null ? DateTime.parse(model.finishedAt!) : null,
    );
  }
}
