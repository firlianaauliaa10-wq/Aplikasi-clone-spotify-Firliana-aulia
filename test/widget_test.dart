
import 'package:flutter_test/flutter_test.dart';
import 'package:spotify/main.dart';

void main() {
  testWidgets('Spotify app starts correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const SpotifyApp());

    expect(find.text('Spotify'), findsOneWidget);
    expect(find.text('Log in to Spotify'), findsOneWidget);
  });
}
