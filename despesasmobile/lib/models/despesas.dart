import 'package:despesasmobile/enums/forma_pagamento.dart';
import 'package:despesasmobile/enums/tipo_despesa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'despesas.g.dart';

@JsonSerializable()
class Despesas {
  Despesas(
      {this.id = 0,
      required this.descricao,
      required this.nomeDespesa,
      required this.valor,
      required this.data,
      required this.categoria,
      required this.formaPagamento});

  final int id;
  final String nomeDespesa;
  final double valor;
  final DateTime data;
  final TipoDespesa categoria;
  final String descricao;
  final FormaPagamento formaPagamento;

  Map<String, dynamic> toJson() => _$DespesasToJson(this);

  factory Despesas.fromJson(Map<String, dynamic> json) =>
      _$DespesasFromJson(json);
}
