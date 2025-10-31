import 'package:quiz_radioamatori/src/features/quiz/data/model/curated_set_model/curated_set_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/curated_set/curated_set.dart';

class CuratedSetMapper {
  CuratedSet fromModel(CuratedSetModel model) {
    return CuratedSet(
      id: model.id,
      ownerId: model.ownerId,
      title: model.title,
      description: model.description,
      customTopics: model.customTopics,
      isPublished: model.isPublished,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
