import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_accuracy.freezed.dart';

@freezed
abstract class TotalAccuracy with _$TotalAccuracy {
  const factory TotalAccuracy({
    required int totalAnswers,
    required int correctAnswers,
    required int wrongAnswers,
    required double accuracyPercent,
  }) = _TotalAccuracy;
}
