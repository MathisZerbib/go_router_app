import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/postulant_page.dart';
import 'package:test_router_app/views/single_postulant.dart';

class PostulantRoutes {
  final routes = GoRoute(
    path: '/postulants',
    name: 'postulants',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        const NoTransitionPage(
      child: PostulantPage(label: 'Postulants List'),
    ),
    routes: [
      GoRoute(
        name: 'postulant',
        path: ':id',
        builder: (context, state) => SinglePostulantPage(
          id: state.params['id'],
        ),
      ),
    ],
  );
}
