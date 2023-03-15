import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 82, 102, 1),
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed("Tableau de bord"),
          child: const Text("Aller sur le tableau de bord"),
        ),
      ),
    );
  }
}
