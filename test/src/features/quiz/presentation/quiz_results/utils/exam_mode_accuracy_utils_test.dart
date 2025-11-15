import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_question_result/quiz_set_question_result.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_results/utils/exam_mode_accurancy_utils.dart';

void main() {
  group('ExamModeAccuracyUtils', () {
    group('calculateExamTypeAccuracy', () {
      test('should return empty map when answers list is empty', () {
        // Arrange
        final answers = <QuizSetQuestionResult>[];

        // Act
        final result = ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);

        // Assert
        expect(result, isEmpty);
      });

      test('should calculate accuracy for single ExamType with all correct answers', () {
        // Arrange
        final answers = [
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 1,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'A',
            isCorrect: true,
            correctAnswer: 'Answer A',
            questionText: 'Question 1',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 2,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'B',
            isCorrect: true,
            correctAnswer: 'Answer B',
            questionText: 'Question 2',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 3,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'C',
            isCorrect: true,
            correctAnswer: 'Answer C',
            questionText: 'Question 3',
          ),
        ];

        // Act
        final result = ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);

        // Assert
        expect(result.length, 1);
        expect(result[ExamType.completo], 1.0);
      });

      test('should calculate accuracy for single ExamType with all wrong answers', () {
        // Arrange
        final answers = [
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 1,
            topicName: 'Topic1',
            exam: ExamType.parziale,
            correctLetter: 'A',
            isCorrect: false,
            correctAnswer: 'Answer A',
            questionText: 'Question 1',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 2,
            topicName: 'Topic1',
            exam: ExamType.parziale,
            correctLetter: 'B',
            isCorrect: false,
            correctAnswer: 'Answer B',
            questionText: 'Question 2',
          ),
        ];

        // Act
        final result = ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);

        // Assert
        expect(result.length, 1);
        expect(result[ExamType.parziale], 0.0);
      });

      test('should calculate accuracy for single ExamType with mixed answers', () {
        // Arrange
        final answers = [
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 1,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'A',
            isCorrect: true,
            correctAnswer: 'Answer A',
            questionText: 'Question 1',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 2,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'B',
            isCorrect: false,
            correctAnswer: 'Answer B',
            questionText: 'Question 2',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 3,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'C',
            isCorrect: true,
            correctAnswer: 'Answer C',
            questionText: 'Question 3',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 4,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'D',
            isCorrect: false,
            correctAnswer: 'Answer D',
            questionText: 'Question 4',
          ),
        ];

        // Act
        final result = ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);

        // Assert
        expect(result.length, 1);
        expect(result[ExamType.completo], 0.5); // 2 correct out of 4
      });

      test('should calculate accuracy for multiple ExamTypes', () {
        // Arrange
        final answers = [
          // Completo: 2 correct out of 3 = 0.666...
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 1,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'A',
            isCorrect: true,
            correctAnswer: 'Answer A',
            questionText: 'Question 1',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 2,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'B',
            isCorrect: true,
            correctAnswer: 'Answer B',
            questionText: 'Question 2',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 3,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'C',
            isCorrect: false,
            correctAnswer: 'Answer C',
            questionText: 'Question 3',
          ),
          // Parziale: 1 correct out of 2 = 0.5
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 4,
            topicName: 'Topic2',
            exam: ExamType.parziale,
            correctLetter: 'A',
            isCorrect: true,
            correctAnswer: 'Answer A',
            questionText: 'Question 4',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 5,
            topicName: 'Topic2',
            exam: ExamType.parziale,
            correctLetter: 'B',
            isCorrect: false,
            correctAnswer: 'Answer B',
            questionText: 'Question 5',
          ),
        ];

        // Act
        final result = ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);

        // Assert
        expect(result.length, 2);
        expect(result[ExamType.completo], closeTo(2 / 3, 0.001)); // 0.666...
        expect(result[ExamType.parziale], 0.5);
      });

      test('should handle ExamType with single answer correctly', () {
        // Arrange
        final answers = [
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 1,
            topicName: 'Topic1',
            exam: ExamType.completo,
            correctLetter: 'A',
            isCorrect: true,
            correctAnswer: 'Answer A',
            questionText: 'Question 1',
          ),
        ];

        // Act
        final result = ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);

        // Assert
        expect(result.length, 1);
        expect(result[ExamType.completo], 1.0);
      });

      test('should calculate fractional accuracy correctly', () {
        // Arrange - 1 correct out of 3 = 0.333...
        final answers = [
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 1,
            topicName: 'Topic1',
            exam: ExamType.parziale,
            correctLetter: 'A',
            isCorrect: true,
            correctAnswer: 'Answer A',
            questionText: 'Question 1',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 2,
            topicName: 'Topic1',
            exam: ExamType.parziale,
            correctLetter: 'B',
            isCorrect: false,
            correctAnswer: 'Answer B',
            questionText: 'Question 2',
          ),
          const QuizSetQuestionResult(
            setId: 'set1',
            questionId: 3,
            topicName: 'Topic1',
            exam: ExamType.parziale,
            correctLetter: 'C',
            isCorrect: false,
            correctAnswer: 'Answer C',
            questionText: 'Question 3',
          ),
        ];

        // Act
        final result = ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);

        // Assert
        expect(result.length, 1);
        expect(result[ExamType.parziale], closeTo(1 / 3, 0.001)); // 0.333...
      });
    });
  });
}

