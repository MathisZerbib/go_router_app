import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/error_page.dart';
import 'package:test_router_app/views/postulant_page.dart';
import 'package:test_router_app/views/root_page.dart';
import 'package:test_router_app/views/single_postulant.dart';
import 'package:test_router_app/widgets/bottom_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
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
          GoRoute(
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
          ),
          GoRoute(
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
          ),
          GoRoute(
            path: '/postulants',
            name: 'postulants',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage(
                    child: PostulantPage(label: 'Postulants List')

                    //   child: RootPage(
                    //       label: 'Postulants', detailsPath: '/postulants/details'),
                    // ),
                    ),
            routes: [
              GoRoute(
                name: 'postulant',
                path: ':id',
                builder: (context, state) =>
                    SinglePostulantPage(id: state.params['id']),
              ),
            ],
          ),
          GoRoute(
            path: '/etablishment',
            name: 'etablishment',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage(
              child: RootPage(
                  label: 'Etablishment', detailsPath: '/etablishment/details'),
            ),
            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) =>
                    const DetailsScreen(label: 'Etablishment'),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
