import 'package:despesasmobile/enums/tipo_despesa.dart';
import 'package:despesasmobile/models/despesas.dart';
import 'package:despesasmobile/models/total_despesas.dart';
import 'package:flutter/material.dart';

class ChartController {
  final List<Despesas> despesas;

  ChartController(this.despesas);

  List<TotalDespesas> get buckets {
    return [
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.alimentacao,
          const Color.fromARGB(255, 180, 221, 255)),
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.lazer,
          const Color.fromARGB(255, 135, 167, 193)),
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.viagem,
          const Color.fromARGB(255, 111, 164, 207)),
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.trabalho,
          const Color.fromARGB(255, 18, 101, 164)),
    ];
  }

  Color getColorForTipoDespesa(TipoDespesa tipo) {
    final bucket = buckets.firstWhere(
      (bucket) => bucket.categoria == tipo,
      orElse: () => TotalDespesas(
          categoria: TipoDespesa.alimentacao,
          corDespesa: Colors.green,
          despesas: despesas),
    );
    return bucket.corDespesa;
  }

  double get maxTotalDespesa {
    double maxTotalDespesa = 0;

    for (final bucket in buckets) {
      if (bucket.totalDespesas > maxTotalDespesa) {
        maxTotalDespesa = bucket.totalDespesas;
      }
    }

    return maxTotalDespesa;
  }
}
