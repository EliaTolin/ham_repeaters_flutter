import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_question_result/quiz_set_question_result.dart';

class ExamModeAccuracyUtils {
  static Map<ExamType, double> calculateExamTypeAccuracy(List<QuizSetQuestionResult> answers) {
    final examTypes = answers.map((answer) => answer.exam).toSet();
    final examTypeAccuracy = <ExamType, double>{};
    for (final examType in examTypes) {
      final answersForMode = answers.where((answer) => answer.exam == examType).toList();
      final accuracy =
          answersForMode.where((answer) => answer.isCorrect).length / answersForMode.length;
      examTypeAccuracy[examType] = accuracy;
    }
    return examTypeAccuracy;
  }
}
