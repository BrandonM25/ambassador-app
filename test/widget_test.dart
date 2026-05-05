import 'package:ambassador_app/src/app/ambassador_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Ambassador app boots', (WidgetTester tester) async {
    await tester.pumpWidget(const AmbassadorApp());
    expect(find.text('A'), findsOneWidget);
  });
}
