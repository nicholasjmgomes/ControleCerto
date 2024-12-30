import 'package:despesasmobile/enums/enum_nomeado.dart';
import 'package:despesasmobile/utils/extensao_enum.dart';
import 'package:json_annotation/json_annotation.dart';

enum TipoDespesa implements EnumNomeado {
  @JsonValue("alimentacao")
  alimentacao("Alimentação"),
  @JsonValue("trabalho")
  trabalho("Trabalho"),
  @JsonValue("viagem")
  viagem("Viagem"),
  @JsonValue("lazer")
  lazer("Lazer");

  @override
  final String nome;

  @override
  String pegaValorEnum([bool capitalizeFirst = true]) =>
      retornaValorDoEnumString(capitalizeFirst);

  const TipoDespesa(this.nome);

  String toJson() => toString().split('.').last;

  static TipoDespesa fromJson(String json) {
    return TipoDespesa.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == json.toLowerCase(),
      orElse: () => throw ArgumentError('Tipo de despesa desconhecida: $json'),
    );
  }
}
