import 'package:despesasmobile/components/base_drawer.dart';
import 'package:despesasmobile/components/botao_cancelar.dart';
import 'package:despesasmobile/components/botao_salvar.dart';
import 'package:despesasmobile/components/dropdown.dart';
import 'package:despesasmobile/components/title_text.dart';
import 'package:despesasmobile/enums/forma_pagamento.dart';
import 'package:despesasmobile/enums/tipo_despesa.dart';
import 'package:despesasmobile/injections/custom_injection.dart';
import 'package:despesasmobile/modules/controllers/despesas_controller.dart';
import 'package:despesasmobile/utils/formatadores.dart';
import 'package:despesasmobile/validacao/validadores.dart';
import 'package:flutter/material.dart';
import 'package:despesasmobile/components/text_box.dart';
import 'package:flutter/services.dart';

class EditarDespesa extends StatefulWidget {
  const EditarDespesa({super.key});

  @override
  State<EditarDespesa> createState() => _EditarDespesaState();
}

class _EditarDespesaState extends State<EditarDespesa> {
  final controller = getIt<DespesasController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Header(
                    texto: 'Editar despesa',
                    padding: EdgeInsets.only(left: 13), // CAMARADA
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleText('Nome da despesa'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextBox(
                              controller: controller.nomeDespesaController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => Validadores.nome(value),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const TitleText('Valor'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: TextBox(
                                          controller:
                                              controller.valorDespesaController,
                                          prefixText: 'R\$ ',
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          inputFormatters: [
                                            Formatadores.valor(),
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) =>
                                              Validadores.valor(value!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18.0, left: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ValueListenableBuilder<DateTime?>(
                                      valueListenable:
                                          controller.dataEscolhidaNotifier,
                                      builder: (context, dataEscolhida, child) {
                                        return Text(
                                          dataEscolhida == null
                                              ? 'Escolha a Data'
                                              : controller.formatter
                                                  .format(dataEscolhida),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          controller.dataSelecionada(context),
                                      icon: const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.lightBlue,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const TitleText('Tipo'),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      ListenableBuilder(
                                        listenable:
                                            controller.tipoDespesaNotifier,
                                        builder: (context, child) {
                                          return ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Dropdown<TipoDespesa>(
                                                value: controller
                                                    .tipoDespesaNotifier.value,
                                                items: TipoDespesa.values,
                                                itemToString:
                                                    (TipoDespesa? value) =>
                                                        value!.nome,
                                                onChanged:
                                                    (TipoDespesa? newValue) =>
                                                        controller
                                                            .tipoDespesaNotifier
                                                            .value = newValue!,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TitleText('Pagamento'),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      ListenableBuilder(
                                        listenable:
                                            controller.tipoDespesaNotifier,
                                        builder: (context, child) {
                                          return ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 14.0),
                                              child: Dropdown<FormaPagamento>(
                                                value: controller
                                                    .pagamentoEscolhidoNotifier
                                                    .value,
                                                items: FormaPagamento.values,
                                                itemToString:
                                                    (FormaPagamento? value) =>
                                                        value!.nome,
                                                onChanged: (FormaPagamento?
                                                        newValue) =>
                                                    controller
                                                        .pagamentoEscolhidoNotifier
                                                        .value = newValue!,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TitleText('Descrição da despesa'),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              bottom: 20,
                            ),
                            child: TextBox(
                              controller: controller.descricaoDespesaController,
                              maxLength: 200,
                              validator: (value) =>
                                  Validadores.descricao(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CancelarBotao(
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                BotaoSalvar(
                                  text: 'Salvar',
                                  onPressed: () {
                                    final isValid = controller
                                            .formKey.currentState
                                            ?.validate() ??
                                        false;
                                    if (isValid) {
                                      controller.onPressedSalvar();
                                      Navigator.pop(context);
                                      controller.toastDeSucesso(context);
                                    }
                                    return;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
