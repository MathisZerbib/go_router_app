import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/root_page.dart';

class PostulantRoutes {
  final routes = GoRoute(
    path: '/offers',
    name: 'offers',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        const NoTransitionPage(
      child: RootPage(label: 'Offers', detailsPath: '/offers/details'),
    ),
    routes: [
      GoRoute(
        path: 'details',
        builder: (BuildContext context, GoRouterState state) =>
            const DetailsScreen(label: 'Offers'),
      ),
    ],
  );
}
