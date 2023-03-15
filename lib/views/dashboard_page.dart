import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TdbPage extends StatelessWidget {
  const TdbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => {context.goNamed('home')},
              child: const Text('go home')),
        ],
      ),
    );
  }
}
