import 'package:despesasmobile/models/despesas.dart';

class DespesasEndpoints {
  static const String baseUrl =
      'https://7af1-177-192-15-162.ngrok-free.app/api/despesas';

  static String getDespesas() {
    return baseUrl;
  }

  static String getDespesaEspecifica(int idDespesa) {
    return '$baseUrl/BuscarPorId/$idDespesa';
  }

  static String saveDespesa(Despesas despesa) {
    return '$baseUrl/IncluirDespesa';
  }

  static String deleteDespesa(int idDespesa) {
    return '$baseUrl/ExcluirDespesa/$idDespesa';
  }

  static String updateDespesa(Despesas despesa) {
    return '$baseUrl/AtualizarDespesa';
  }
}
