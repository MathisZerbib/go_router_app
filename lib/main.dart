import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/views/details_screen.dart';
import 'package:test_router_app/views/error_page.dart';
import 'package:test_router_app/views/postulant_page.dart';
import 'package:test_router_app/views/root_page.dart';
import 'package:test_router_app/views/single_postulant.dart';
import 'package:test_router_app/widgets/bottom_nav_bar.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GlobalKey<NavigatorState> _rootNavigatorKey;
  late final GlobalKey<NavigatorState> _shellNavigatorKey;
  late final GoRouter _router;

  @override
  void initState() {
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();
// the one and only GoRouter instance
    _router = GoRouter(
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
                child:
                    RootPage(label: 'Offers', detailsPath: '/offers/details'),
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
                    label: 'Etablishment',
                    detailsPath: '/etablishment/details'),
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
    // _router = GoRouter(
    //   navigatorKey: _rootNavigatorKey,
    //   debugLogDiagnostics: true,
    //   initialLocation: '/dashboard',
    //   routes: <RouteBase>[
    //     ShellRoute(
    //       navigatorKey: _shellNavigatorKey,
    //       builder: (BuildContext context, GoRouterState state, Widget child) {
    //         return Scaffold(
    //           body: child,
    //           bottomNavigationBar: BottomNavigationBar(
    //             items: const <BottomNavigationBarItem>[
    //               BottomNavigationBarItem(
    //                 icon: Icon(Icons.home),
    //                 label: 'Dashboard',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: Icon(Icons.business),
    //                 label: 'Offres',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: Icon(Icons.school),
    //                 label: 'Jobbeurs',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: Icon(Icons.school),
    //                 label: 'Etablissement',
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: '/dashboard',
    //           name: 'dashboard',
    //           builder: (BuildContext context, GoRouterState state) {
    //             return const DashboardPage();
    //           },
    //         ),
    //         GoRoute(
    //           path: '/offres',
    //           name: 'offres',
    //           builder: (BuildContext context, GoRouterState state) {
    //             return const OffresPage();
    //           },
    //         ),
    //         GoRoute(
    //           path: '/jobbeurs',
    //           name: 'jobbeurs',
    //           builder: (BuildContext context, GoRouterState state) {
    //             return const PostulantPage();
    //           },
    //         ),
    //         GoRoute(
    //           path: '/etablissement',
    //           name: 'etablissement',
    //           builder: (BuildContext context, GoRouterState state) {
    //             return const EtablissementPage();
    //           },
    //         ),
    //       ],
    //     ),
    //     // ShellRoute(
    //     //   navigatorKey: _shellNavigatorKey,
    //     //   builder: (context, state, child) {
    //     //     return const Scaffold(
    //     //       body: Center(
    //     //         child: Text('Shell'),
    //     //       ),
    //     //     );
    //     //   },
    //     // ),
    //     // GoRoute(
    //     //   name: 'login',
    //     //   path: '/',
    //     //   builder: (BuildContext context, GoRouterState state) =>
    //     //       const LoginPage(),
    //     //   routes: <GoRoute>[
    //     //     GoRoute(
    //     //       name: 'home',
    //     //       path: 'home',
    //     //       builder: (BuildContext context, GoRouterState state) =>
    //     //           const HomePage(),
    //     //     ),
    //     //     GoRoute(
    //     //       name: 'users',
    //     //       path: 'users',
    //     //       builder: (BuildContext context, GoRouterState state) =>
    //     //           const UsersPage(),
    //     //     ),
    //     //     GoRoute(
    //     //       name: 'user',
    //     //       path: 'users/:id',
    //     //       builder: (BuildContext context, GoRouterState state) =>
    //     //           SingleUserPage(id: state.params['id']),
    //     //     ),
    //     //   ],
    //     // )
    //   ],
    //   errorBuilder: (BuildContext context, GoRouterState state) =>
    //       const ErrorPage(),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
