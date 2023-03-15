import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EtablissementPage extends StatelessWidget {
  const EtablissementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Etablissement'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {context.goNamed('home')},
                child: const Text('aller sur le Tableau de bord')),
          ],
        ),
      ),
    ));
  }
}
