enum ExamType {
  parziale('PARZIALE'),
  completo('COMPLETO');

  const ExamType(this.value);
  final String value;

  static ExamType fromString(String value) {
    switch (value.toUpperCase()) {
      case 'PARZIALE':
        return ExamType.parziale;
      case 'COMPLETO':
        return ExamType.completo;
      default:
        throw ArgumentError('Invalid ExamType value: $value');
    }
  }

  @override
  String toString() {
    return switch (this) {
      ExamType.parziale => 'Normativa',
      ExamType.completo => 'Radiotecnica',
    };
  }
}
