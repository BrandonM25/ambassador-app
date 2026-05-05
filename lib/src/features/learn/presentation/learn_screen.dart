import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = [
      'Gospel','Jesus Christ','Bible Reliability','Logic','Evangelism','Eternal Security','Rewards / Inheritance','Church','End Times'
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: 'Teaching Library'),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 260, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 2.8),
                itemCount: categories.length,
                itemBuilder: (context, i) => PremiumCard(child: Align(alignment: Alignment.centerLeft, child: Text(categories[i]))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
