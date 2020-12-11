class Conta {
  String nome;
  double valorOriginal;
  double valorCorrigido;
  DateTime dataVencimento;
  DateTime dataPagamento;
  int qtdDiasAtraso;

  Conta(
      {this.nome,
      this.valorOriginal,
      this.valorCorrigido,
      this.dataVencimento,
      this.dataPagamento,
      this.qtdDiasAtraso});

  factory Conta.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Conta(
        nome: map['nome'],
        valorOriginal: map['valorOriginal'].toDouble(),
        valorCorrigido: map['valorCorrigido'].toDouble(),
        dataVencimento: DateTime.parse(map['dataVencimento']),
        dataPagamento: DateTime.parse(map['dataPagamento']),
        qtdDiasAtraso: map['qtdDiasAtraso'].toInt());
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'valorOriginal': valorOriginal,
        'dataVencimento': dataVencimento.toIso8601String(),
        'dataPagamento': dataPagamento.toIso8601String(),
      };
}
