import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/topic_accuracy_model/topic_accuracy_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_accuracy/topic_accuracy.dart';

class TopicAccuracyMapper implements Mapper<TopicAccuracy, TopicAccuracyModel> {
  @override
  TopicAccuracyModel toModel(TopicAccuracy entity) {
    return TopicAccuracyModel(
      topicName: entity.topicName,
      label: entity.label,
      totalAnswers: entity.totalAnswers,
      correctAnswers: entity.correctAnswers,
      wrongAnswers: entity.wrongAnswers,
      accuracyPercent: entity.accuracyPercent,
    );
  }

  @override
  TopicAccuracy fromModel(TopicAccuracyModel model) {
    return TopicAccuracy(
      topicName: model.topicName,
      label: model.label,
      totalAnswers: model.totalAnswers,
      correctAnswers: model.correctAnswers,
      wrongAnswers: model.wrongAnswers,
      accuracyPercent: model.accuracyPercent,
    );
  }
}
