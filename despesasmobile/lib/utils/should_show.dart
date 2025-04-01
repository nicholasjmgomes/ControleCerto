import 'package:flutter/material.dart';

/// A classe ShouldShow é um Custom Widget sem estado que decide
/// se um widget filho é visível ou não a partir de uma variável booleada
class ShouldShow extends StatelessWidget {
  const ShouldShow(
      {required this.visible,
      required this.child,
      this.replacement = const SizedBox.shrink(),
      super.key});

  final Widget child;

  // Definido como SizedBox.shrink() por default, porém
  // pode ser utilizado para substituição de widgets,
  // mantendo sua característica de sair da árvore de widgets quando necessário
  final Widget replacement;

  /// Se visible for "true", o widget filho será exibido
  /// Se visible for "false" ou "null", o widget filho será ocultado
  final bool? visible;

  @override
  Widget build(context) {
    if ((visible == null) || (visible == false)) {
      return replacement;
    }

    return child;
  }
}
