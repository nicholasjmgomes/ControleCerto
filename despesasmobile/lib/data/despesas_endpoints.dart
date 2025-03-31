import 'package:despesasmobile/models/despesas.dart';

class DespesasEndpoints {
  static const String baseUrl =
      'https://7423-177-192-15-162.ngrok-free.app/api/despesas/';

  static String getDespesas() {
    return baseUrl;
  }

  static String getDespesaEspecifica(int idDespesa) {
    return '$baseUrl/$idDespesa';
  }

  static String saveDespesa(Despesas despesa) {
    return baseUrl;
  }

  static String deleteDespesa(int idDespesa) {
    return '${baseUrl}ExcluirDespesa/$idDespesa';
  }

  static String updateDespesa(Despesas despesa) {
    return baseUrl;
  }
}
