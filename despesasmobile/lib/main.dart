import 'package:despesasmobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:despesasmobile/injections/custom_injection.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar locais suportados pela biblioteca intl
  await initializeDateFormatting('pt_BR', null);
  customInjection();
  runApp(const DespesasMobile());
}

class DespesasMobile extends StatelessWidget {
  const DespesasMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false, routerConfig: Routes.router);
  }
}
