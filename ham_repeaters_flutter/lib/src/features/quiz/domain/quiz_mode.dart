enum QuizMode {
  perTopic('PER_TOPIC'),
  perEsame('PER_ESAME');

  const QuizMode(this.value);
  final String value;

  static QuizMode fromString(String value) {
    switch (value.toUpperCase()) {
      case 'PER_TOPIC':
        return QuizMode.perTopic;
      case 'PER_ESAME':
        return QuizMode.perEsame;
      default:
        throw ArgumentError('Invalid QuizMode value: $value');
    }
  }
}
