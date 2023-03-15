import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  color: Colors.green,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Nombre de postulants',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  color: Colors.greenAccent,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Nombre de postulants',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Satistiques',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
