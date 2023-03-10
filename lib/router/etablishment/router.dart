import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/root_page.dart';

class EtablishmentRoutes {
  final routes = GoRoute(
    path: '/etablishment',
    name: 'etablishment',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        const NoTransitionPage(
      child:
          RootPage(label: 'Etablishment', detailsPath: '/etablishment/details'),
    ),
    routes: [
      GoRoute(
        path: 'details',
        builder: (context, state) => const DetailsScreen(label: 'Etablishment'),
      ),
    ],
  );
}
