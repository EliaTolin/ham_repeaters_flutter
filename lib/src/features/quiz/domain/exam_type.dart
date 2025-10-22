enum ExamType {
  parziale('PARZIALE'),
  totale('TOTALE');

  const ExamType(this.value);
  final String value;

  static ExamType fromString(String value) {
    switch (value) {
      case 'PARZIALE':
        return ExamType.parziale;
      case 'TOTALE':
        return ExamType.totale;
      default:
        throw ArgumentError('Invalid ExamType value: $value');
    }
  }
}
