import 'package:flutter/material.dart';

class DoctrineScreen extends StatelessWidget {
  const DoctrineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctrine Constitution')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Placeholder: Ambassador is guided by a literal, grammatical, historical interpretation of Scripture and a Scripture-first approach to evangelism and apologetics.',
        ),
      ),
    );
  }
}
