import 'package:ham_repeaters/src/features/quiz/data/model/curated_set_preview_model/curated_set_preview_model.dart';
import 'package:ham_repeaters/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';

class CuratedSetPreviewMapper {
  CuratedSetPreview fromModel(CuratedSetPreviewModel model) {
    return CuratedSetPreview(
      id: model.id,
      title: model.title,
      description: model.description,
      questionsCount: model.questionsCount,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
