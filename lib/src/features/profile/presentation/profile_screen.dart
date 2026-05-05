import 'package:ambassador_app/src/features/doctrine/presentation/doctrine_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Profile / Settings', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          ListTile(
            title: const Text('Doctrine Constitution'),
            subtitle: const Text('Concise placeholder text'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DoctrineScreen())),
          ),
        ],
      ),
    );
  }
}
