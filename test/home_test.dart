import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:test_example/models/favorites.dart';
import 'package:test_example/screens/home.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets(
      'Testing Scrolling',
      (tester) async {
        await tester.pumpWidget(createHomeScreen());
        expect(find.text('Item 0'), findsOneWidget);

        ///verilen offsete göre taşma vs kontrol eder warn true uyarı verir.
        await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);

        ///[pump]Bu  tüm animasyonların tamamlanmasını bekler.
        ///Verilen zaman aşımı süresinin sona ermesi daha uzun sürerse,
        ///test başarısız olur (bu yöntem bir exception atar).
        ///Bu özellikle devam eden sonsuz bir animasyon varsa
        ///(circular)
        /// bu yöntemin fırlatacağı anlamına gelir.

        await tester.pumpAndSettle();
        expect(find.text('Item 0'), findsNothing);
      },
    );
    testWidgets('Testing if ListView shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
