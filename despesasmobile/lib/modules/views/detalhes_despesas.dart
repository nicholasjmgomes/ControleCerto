import 'package:despesasmobile/components/botao_editar.dart';
import 'package:despesasmobile/components/botao_excluir.dart';
import 'package:despesasmobile/injections/custom_injection.dart';
import 'package:despesasmobile/models/despesas.dart';
import 'package:despesasmobile/modules/controllers/despesas_controller.dart';
import 'package:despesasmobile/modules/views/base_dialog.dart';
import 'package:despesasmobile/utils/formatadores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalhesDespesa extends StatefulWidget {
  const DetalhesDespesa(
      {super.key,
      required this.onPressed,
      required this.despesa,
      required this.onPressedEditar});

  final void Function() onPressed;
  final void Function() onPressedEditar;
  final Despesas despesa;

  @override
  State<DetalhesDespesa> createState() => _DetalhesDespesaState();
}

class _DetalhesDespesaState extends State<DetalhesDespesa> {
  final controller = getIt<DespesasController>();
  late List<Despesas> despesas;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      titulo: 'Detalhes da despesa',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 3, 8, 77),
                    ),
                    children: [
                      const TextSpan(
                        text: 'Título: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color.fromARGB(255, 3, 8, 77),
                        ),
                      ),
                      TextSpan(
                        text: widget.despesa.nomeDespesa,
                        style: GoogleFonts.roboto(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Valor: ',
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 3, 8, 77),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'R\$ ${widget.despesa.valor.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: GoogleFonts.roboto(color: Colors.lightBlue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Data: ',
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 3, 8, 77),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Formatadores.dataFormatada(widget.despesa.data),
                      style: GoogleFonts.roboto(color: Colors.lightBlue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Tipo de despesa: ',
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 3, 8, 77),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.despesa.categoria.nome,
                      style: GoogleFonts.roboto(color: Colors.lightBlue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 3, 8, 77),
                    ),
                    children: [
                      const TextSpan(
                        text: 'Descrição: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color.fromARGB(255, 3, 8, 77),
                        ),
                      ),
                      TextSpan(
                        text: widget.despesa.descricao,
                        style: GoogleFonts.roboto(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoEditar(onPressed: () async {
                  widget.onPressedEditar();
                  Navigator.of(context).pop();
                }),
                const SizedBox(
                  width: 20,
                ),
                BotaoExcluir(
                  onPressed: () {
                    widget.onPressed();
                    Navigator.of(context).pop();
                    controller.toastExclusaoSucesso(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
