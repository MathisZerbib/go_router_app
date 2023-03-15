import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/router/tdb/router.dart';
import 'package:test_router_app/router/etablissement/router.dart';
import 'package:test_router_app/router/offer/router.dart';
import 'package:test_router_app/router/postulant/router.dart';
import 'package:test_router_app/views/error_page.dart';
import 'package:test_router_app/widgets/bottom_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MainRouter {
  final routes = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const ErrorPage(),
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          TdbRoutes().routes,
          OffreRoutes().routes,
          PostulantRoutes().routes,
          EtablissementRoutes().routes,
        ],
      ),
    ],
  );
}
