import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/topic_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic.dart';

class TopicMapper implements Mapper<Topic, TopicModel> {
  @override
  TopicModel toModel(Topic entity) {
    return TopicModel(
      name: entity.name,
      description: entity.description,
    );
  }

  @override
  Topic fromModel(TopicModel model) {
    return Topic(
      name: model.name,
      description: model.description,
    );
  }
}
