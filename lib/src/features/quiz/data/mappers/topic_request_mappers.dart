import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/topic_request_model/topic_request_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_request/topic_request.dart';

class TopicRequestMapper implements Mapper<TopicRequest, TopicRequestModel> {
  @override
  TopicRequestModel toModel(TopicRequest entity) {
    return TopicRequestModel(
      topic: entity.topic,
      numQuestions: entity.numQuestions,
    );
  }

  @override
  TopicRequest fromModel(TopicRequestModel model) {
    return TopicRequest(
      topic: model.topic,
      numQuestions: model.numQuestions,
    );
  }
}
