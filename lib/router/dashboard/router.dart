import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/root_page.dart';

class DashboardRoutes {
  final routes = GoRoute(
    path: '/',
    name: 'dashboard',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        const NoTransitionPage(
      child: RootPage(label: 'Dashboard', detailsPath: '/'),
    ),
    routes: [
      GoRoute(
        path: 'details',
        builder: (BuildContext context, GoRouterState state) =>
            const DetailsScreen(label: 'Dashboard'),
      ),
    ],
  );
}
