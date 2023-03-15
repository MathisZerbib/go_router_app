import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Widget for the root/initial pages in the bottom navigation bar.
class RootPage extends StatelessWidget {
  /// Creates a RootPage
  const RootPage({required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String label;

  /// The path to the detail page
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen $label',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () => context.go(detailsPath),
              child: const Text('voir le detail'),
            ),
          ],
        ),
      ),
    );
  }
}
