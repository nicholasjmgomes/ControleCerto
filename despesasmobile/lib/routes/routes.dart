import 'package:despesasmobile/modules/views/despesas_page.dart';
import 'package:despesasmobile/modules/splash/splash_page.dart';
import 'package:despesasmobile/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static Future<String?> redirect(
      BuildContext context, GoRouterState state) async {
    return RouteNamesNavigation.home;
  }

  static final router = GoRouter(
    initialLocation: RouteNamesNavigation.splash,
    redirect: redirect,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
          path: RouteNames.homePage,
          builder: (context, state) => const DespesasPage()),
    ],
  );
}
