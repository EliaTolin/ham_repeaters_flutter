import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/topic_with_stats_model/topic_with_stats_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_with_stats/topic_with_stats.dart';

class TopicWithStatsMapper implements Mapper<TopicWithStats, TopicWithStatsModel> {
  @override
  TopicWithStatsModel toModel(TopicWithStats entity) {
    return TopicWithStatsModel(
      name: entity.name,
      label: entity.label,
      description: entity.description,
      totalQuestions: entity.totalQuestions,
    );
  }

  @override
  TopicWithStats fromModel(TopicWithStatsModel model) {
    return TopicWithStats(
      name: model.name,
      label: model.label,
      description: model.description,
      totalQuestions: model.totalQuestions,
    );
  }
}
