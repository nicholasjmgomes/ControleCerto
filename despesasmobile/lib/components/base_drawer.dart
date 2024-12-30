import 'package:despesasmobile/components/botao_voltar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({required this.texto, this.child, this.padding, super.key});

  final Widget? child;
  final String texto;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        color: Color.fromARGB(255, 3, 8, 77),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BotaoVoltar(
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(
              width: 14,
            ),
            Padding(
              padding: padding!,
              child: Text(
                texto,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
