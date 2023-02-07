import 'package:flutter_test/flutter_test.dart';
import 'package:example_fakeapi_books/main.dart';


void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });
}
