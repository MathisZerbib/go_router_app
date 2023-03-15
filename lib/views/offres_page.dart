import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OffresPage extends StatelessWidget {
  const OffresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Offres'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {context.goNamed('Tableau de bord')},
                child: const Text('aller sur le Tableau de bord')),
          ],
        ),
      ),
    ));
  }
}
