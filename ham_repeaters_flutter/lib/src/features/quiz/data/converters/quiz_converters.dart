import 'package:json_annotation/json_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_mode.dart';

class ExamTypeConverter implements JsonConverter<ExamType?, String?> {
  const ExamTypeConverter();

  @override
  ExamType? fromJson(String? json) {
    if (json == null) return null;
    return ExamType.fromString(json);
  }

  @override
  String? toJson(ExamType? object) {
    return object?.value;
  }
}

class QuizModeConverter implements JsonConverter<QuizMode, String> {
  const QuizModeConverter();

  @override
  QuizMode fromJson(String json) {
    return QuizMode.fromString(json);
  }

  @override
  String toJson(QuizMode object) {
    return object.value;
  }
}
