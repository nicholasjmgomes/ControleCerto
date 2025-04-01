import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoData extends StatelessWidget {
  const BotaoData(
      {super.key, required this.dataEscolhida, required this.onTap});

  final String dataEscolhida;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataEscolhida,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.calendar_month_outlined,
              color: Colors.lightBlue,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
