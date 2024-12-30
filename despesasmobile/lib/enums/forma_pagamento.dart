import 'package:despesasmobile/enums/enum_nomeado.dart';
import 'package:despesasmobile/utils/extensao_enum.dart';
import 'package:json_annotation/json_annotation.dart';

enum FormaPagamento implements EnumNomeado {
  @JsonValue("pix")
  pix("Pix"),
  @JsonValue("debito")
  debito("Débito"),
  @JsonValue("credito")
  credito("Crédito"),
  @JsonValue("dinheiro")
  dinheiro("Dinheiro");

  @override
  final String nome;

  @override
  String pegaValorEnum([bool capitalizeFirst = true]) =>
      retornaValorDoEnumString(capitalizeFirst);

  const FormaPagamento(this.nome);

  String toJson() => toString().split('.').last;

  static FormaPagamento fromJson(String json) {
    return FormaPagamento.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == json.toLowerCase(),
      orElse: () => throw ArgumentError('Tipo de despesa desconhecida: $json'),
    );
  }
}
