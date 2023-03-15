import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/root_page.dart';

class EtablissementRoutes {
  final routes = GoRoute(
    path: '/etablissement',
    name: 'etablissement',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        const NoTransitionPage(
      child: RootPage(
          label: 'etablissement', detailsPath: '/etablissement/details'),
    ),
    routes: [
      GoRoute(
        path: 'details',
        builder: (context, state) =>
            const DetailsScreen(label: 'Etablissement'),
      ),
    ],
  );
}
