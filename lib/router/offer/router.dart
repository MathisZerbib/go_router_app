import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/root_page.dart';

class OffreRoutes {
  final routes = GoRoute(
    path: '/offres',
    name: 'offres',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        const NoTransitionPage(
      child: RootPage(label: 'Offres', detailsPath: '/offres/details'),
    ),
    routes: [
      GoRoute(
        path: 'details',
        builder: (BuildContext context, GoRouterState state) =>
            const DetailsScreen(label: 'Offres'),
      ),
    ],
  );
}
