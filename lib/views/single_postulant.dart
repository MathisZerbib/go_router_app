import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SinglePostulantPage extends StatefulWidget {
  final String? id;

  const SinglePostulantPage({super.key, required this.id});

  @override
  State<SinglePostulantPage> createState() => SinglePostulantPageState();
}

class SinglePostulantPageState extends State<SinglePostulantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'User ID: ${widget.id}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed('Tableau de bord');
              },
              child: const Text('Retourner en arrière'),
            ),
          ],
        ),
      ),
    );
  }
}
