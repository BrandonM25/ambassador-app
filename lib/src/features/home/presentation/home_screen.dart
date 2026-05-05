import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            PremiumCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'Train to proclaim Christ plainly.'),
                  SizedBox(height: 8),
                  Text('Placeholder: focused formation for discipleship, evangelism, and apologetics.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
