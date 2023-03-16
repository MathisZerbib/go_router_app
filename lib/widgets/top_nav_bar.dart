import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

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
    icon: Icon(Icons.folder),
    label: 'Jobbeurs',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/etablissement',
    icon: Icon(Icons.storefront),
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
        toolbarHeight: 100,
        centerTitle: true,
        // title: Text(appBarTitles[_currentIndex]),

        //  IconButton(
        //   icon: SvgPicture.asset(
        //     "jobme_logo_white.svg",
        //   ),
        //   onPressed: () => context.goNamed('home'),
        // ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: const Color.fromRGBO(0, 82, 102, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () => context.goNamed('home'),
                child: SvgPicture.asset(
                  "jobme_logo_white.svg",
                ),
              ),
            ),
            for (var i = 0; i < tabs.length; i++)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 60,
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: EdgeInsets.zero,
                      foregroundColor: i == _currentIndex
                          ? const Color.fromRGBO(234, 94, 64, 1)
                          : Colors.white,
                      backgroundColor: i == _currentIndex
                          ? Colors.white
                          : const Color.fromARGB(212, 0, 92, 115),
                    ),
                    onPressed: () => _onItemTapped(context, i),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tabs[i].icon,
                          Text(
                            tabs[i].label!,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 82, 102, 1),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 60,
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(234, 94, 64, 1),
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () => context.goNamed('logout'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.logout),
                          Text(
                            'déconnexion',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
