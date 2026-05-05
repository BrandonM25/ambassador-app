import 'package:ambassador_app/src/core/theme/theme_controller.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:ambassador_app/src/features/doctrine/presentation/doctrine_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final isLight = mode == ThemeMode.light;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const SectionHeader(title: 'Profile & Settings', subtitle: 'Refined controls for your Ambassador experience.'),
          const SizedBox(height: 12),
          PremiumCard(
            child: SwitchListTile(
              value: isLight,
              onChanged: (value) => ref.read(themeModeProvider.notifier).toggle(value),
              title: const Text('Light Mode'),
              subtitle: Text(isLight ? 'Warm ivory palette active' : 'Graphite expressive dark active'),
            ),
          ),
          const SizedBox(height: 12),
          PremiumCard(
            child: ListTile(
              leading: const Icon(Icons.workspace_premium_rounded),
              title: const Text('Doctrine Constitution'),
              subtitle: const Text('Concise institutional confession'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DoctrineScreen())),
            ),
          ),
        ],
      ),
    );
  }
}
