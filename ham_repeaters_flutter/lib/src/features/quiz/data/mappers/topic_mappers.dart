import 'package:ham_repeaters/common/abstracts/mapper.dart';
import 'package:ham_repeaters/src/features/quiz/data/model/topic_model/topic_model.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic/topic.dart';

class TopicMapper implements Mapper<Topic, TopicModel> {
  @override
  TopicModel toModel(Topic entity) {
    return TopicModel(
      name: entity.name,
      description: entity.description,
      label: entity.label,
    );
  }

  @override
  Topic fromModel(TopicModel model) {
    return Topic(
      name: model.name,
      description: model.description,
      label: model.label,
    );
  }
}
