class TransactionCategoryCount {
  final double vendas;
  final double alimentacao;
  final double contas;
  final double entretenimento;
  final double roupas;
  final double aleatorio;

  TransactionCategoryCount({
    required this.vendas,
    required this.alimentacao,
    required this.contas,
    required this.entretenimento,
    required this.roupas,
    required this.aleatorio,
  });

  factory TransactionCategoryCount.fromMap(Map<String, double> map) {
    return TransactionCategoryCount(
      vendas: map['vendas'] ?? 0,
      alimentacao: map['alimentacao'] ?? 0,
      contas: map['contas'] ?? 0,
      entretenimento: map['entretenimento'] ?? 0,
      roupas: map['roupas'] ?? 0,
      aleatorio: map['aleatorio'] ?? 0,
    );
  }
}
