import 'package:flutter/material.dart';

class BotaoExcluir extends StatelessWidget {
  const BotaoExcluir({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.delete_rounded, color: Colors.redAccent),
          SizedBox(
            width: 4,
          ),
          Text(
            'Excluir',
            style: TextStyle(color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}
