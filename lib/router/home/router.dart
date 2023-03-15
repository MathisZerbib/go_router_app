import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/home.dart';

class HomeRoutes {
  final routes = GoRoute(
    path: '/home',
    name: 'home',
    // pageBuilder: (BuildContext context, GoRouterState state) =>
    //     const NoTransitionPage(
    //   child: RootPage(label: 'Tableau de bord', detailsPath: '/'),
    // ),
    builder: (BuildContext context, GoRouterState state) => const HomePage(),
    routes: [
      GoRoute(
        path: 'details',
        builder: (BuildContext context, GoRouterState state) =>
            const DetailsScreen(label: 'Tableau de bord'),
      ),
    ],
  );
}
