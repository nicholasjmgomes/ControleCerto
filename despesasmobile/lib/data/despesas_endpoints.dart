class DespesasEndpoints {
  static const String baseUrl =
      'https://f82c-177-192-15-162.ngrok-free.app/api/despesas';

  static String getDespesas() {
    return baseUrl;
  }

  static String getDespesaEspecifica(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String saveDespesa(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String createDespesa() {
    return baseUrl;
  }

  static String deleteDespesa(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String updateDespesa(int idDespesa) {
    return '$baseUrl$idDespesa';
  }
}
