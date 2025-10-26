import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/total_accuracy_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/total_accuracy.dart';

class TotalAccuracyMapper implements Mapper<TotalAccuracy, TotalAccuracyModel> {
  @override
  TotalAccuracyModel toModel(TotalAccuracy entity) {
    return TotalAccuracyModel(
      totalAnswers: entity.totalAnswers,
      correctAnswers: entity.correctAnswers,
      wrongAnswers: entity.wrongAnswers,
      accuracyPercent: entity.accuracyPercent,
    );
  }

  @override
  TotalAccuracy fromModel(TotalAccuracyModel model) {
    return TotalAccuracy(
      totalAnswers: model.totalAnswers,
      correctAnswers: model.correctAnswers,
      wrongAnswers: model.wrongAnswers,
      accuracyPercent: model.accuracyPercent,
    );
  }
}
