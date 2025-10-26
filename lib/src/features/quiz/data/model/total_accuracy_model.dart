import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_accuracy_model.freezed.dart';

@freezed
abstract class TotalAccuracyModel with _$TotalAccuracyModel {
  const factory TotalAccuracyModel({
    @JsonKey(name: 'total_answers') required int totalAnswers,
    @JsonKey(name: 'correct_answers') required int correctAnswers,
    @JsonKey(name: 'wrong_answers') required int wrongAnswers,
    @JsonKey(name: 'accuracy_percent') required double accuracyPercent,
  }) = _TotalAccuracyModel;

  factory TotalAccuracyModel.fromJson(Map<String, dynamic> json) {
    return TotalAccuracyModel(
      totalAnswers: json['total_answers'] as int,
      correctAnswers: json['correct_answers'] as int,
      wrongAnswers: json['wrong_answers'] as int,
      accuracyPercent: (json['accuracy_percent'] as num).toDouble(),
    );
  }
}
