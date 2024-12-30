import 'package:despesasmobile/components/chart.dart';
import 'package:despesasmobile/components/despesas_card.dart';
import 'package:despesasmobile/injections/custom_injection.dart';
import 'package:despesasmobile/models/despesas.dart';
import 'package:despesasmobile/modules/controllers/despesas_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DespesasPage extends StatefulWidget {
  const DespesasPage({super.key});

  @override
  State<DespesasPage> createState() => _DespesasPage();
}

class _DespesasPage extends State<DespesasPage> {
  final controller = getIt<DespesasController>();

  @override
  void initState() {
    super.initState();
    controller.startPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 64),
          child: Text(
            'Controle de Despesas',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 128, 199, 228),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 8, 77),
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder<bool>(
          valueListenable: controller.isLoadingNotifier,
          builder: (context, bool isLoading, child) => Skeletonizer(
            enabled: isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Seu chart de despesas:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 8, 77),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                ValueListenableBuilder<List<Despesas>>(
                  valueListenable: controller.despesasNotifier,
                  builder: (context, despesas, child) =>
                      Chart(despesas: controller.despesasNotifier.value),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Confira suas despesas abaixo:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 8, 77),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder<List<Despesas>>(
                  valueListenable: controller.despesasNotifier,
                  builder: (context, despesas, child) {
                    return Column(
                      children: [
                        Visibility(
                          visible: despesas.isNotEmpty,
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: controller.despesasNotifier.value.length,
                            itemBuilder: (ctx, index) {
                              final despesa = controller.despesas[index];

                              return DespesasCard(
                                onRemoveDespesa: (despesa) {
                                  controller.onPressedExcluir(despesa);
                                },
                                onEditDespesa: (despesa) {
                                  controller.onPressedEditar(
                                      context, despesa.idDespesa);
                                },
                                despesa,
                                cardColor: controller
                                    .getColorForTipoDespesa(despesa.categoria),
                              );
                            },
                          ),
                        ),
                        Visibility(
                          visible: despesas.isEmpty,
                          child: const Center(
                            child: Text(
                              "Nenhuma despesa encontrada",
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 3, 8, 77),
        elevation: 5,
        shape: const CircleBorder(),
        onPressed: () => controller.showAdicionarDespesaDialog(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
