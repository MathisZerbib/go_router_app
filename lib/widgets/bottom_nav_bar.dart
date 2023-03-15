import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

const appBarTitles = <String>[
  'Tableau de bord',
  'Offres',
  'Jobbeurs',
  'Etablissement'
];

const tabs = [
  ScaffoldWithNavBarTabItem(
    initialLocation: '/home',
    icon: Icon(Icons.dashboard),
    label: 'Tableau de bord',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/offres',
    icon: Icon(Icons.work),
    label: 'Offres',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/postulants',
    icon: Icon(Icons.person),
    label: 'Jobbeurs',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/etablissement',
    icon: Icon(Icons.build),
    label: 'Etablissement',
  ),
];

/// Representation of a tab item in the [ScaffoldWithBottomNavBar]
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  // getter that computes the current index from the current location,
  // using the helper method below
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      appBar: AppBar(
        centerTitle: true,
        title: Text(appBarTitles[_currentIndex]),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 82, 102, 1),
        leading: IconButton(
          icon: SvgPicture.asset(
            "jobme_logo_white.svg",
            height: 30,
          ),
          onPressed: () => context.goNamed('Tableau de bord'),
        ),
        actions: [
          for (var i = 0; i < tabs.length; i++)
            IconButton(
              tooltip: tabs[i].label,
              icon: tabs[i].icon,
              color: i == _currentIndex
                  ? const Color.fromRGBO(234, 94, 64, 1)
                  : Colors.white,
              onPressed: () => _onItemTapped(context, i),
            ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.goNamed('logout'),
          ),
        ],
      ),
    );
  }
}
