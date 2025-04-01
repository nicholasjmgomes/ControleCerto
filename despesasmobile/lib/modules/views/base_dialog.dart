import 'package:despesasmobile/components/header.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog(
      {super.key,
      this.width,
      this.height,
      required this.titulo,
      required this.child});

  final double? width;
  final double? height;
  final String titulo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      content: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              texto: titulo,
              padding: EdgeInsets.zero,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
