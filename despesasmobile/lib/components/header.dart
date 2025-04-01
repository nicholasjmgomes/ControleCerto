import 'package:despesasmobile/components/botao_voltar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header(
      {required this.texto,
      this.padding,
      this.height = 65,
      this.width = double.maxFinite,
      super.key});

  final String texto;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
              width: 36,
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
