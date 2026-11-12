import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/screens/login_register_screen.dart';
import 'package:provider/provider.dart';

Widget _wrap(Widget child) => ChangeNotifierProvider(
  create: (_) => MaterialThemesManager(),
  child: MaterialApp(home: Scaffold(body: child)),
);

bool _isObscured(WidgetTester tester, int index) =>
    tester.widgetList<EditableText>(find.byType(EditableText)).elementAt(index).obscureText;

void main() {
  testWidgets('login shows one password field with a show/hide button', (tester) async {
    await tester.pumpWidget(_wrap(const LoginRegisterScreen(isLogin: true)));

    expect(find.byType(TextFormField), findsNWidgets(2)); // email, password
    expect(_isObscured(tester, 1), isTrue);

    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();
    expect(_isObscured(tester, 1), isFalse);

    await tester.tap(find.byTooltip('Hide password'));
    await tester.pump();
    expect(_isObscured(tester, 1), isTrue);
  });

  testWidgets('register adds a re-enter password field that must match', (tester) async {
    var registered = 0;
    await tester.pumpWidget(_wrap(LoginRegisterScreen(isLogin: false, onTapRegister: () => registered++)));

    expect(find.byType(TextFormField), findsNWidgets(3)); // email, password, re-enter
    expect(find.byTooltip('Show password'), findsNWidgets(2));

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'a@b.co');
    await tester.enterText(fields.at(1), 'secret1');
    await tester.enterText(fields.at(2), 'secret2');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Passwords do not match'), findsOneWidget);
    expect(registered, 0);

    await tester.enterText(fields.at(2), 'secret1');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Passwords do not match'), findsNothing);
    expect(registered, 1);
  });

  testWidgets('register can turn the re-enter field off', (tester) async {
    await tester.pumpWidget(_wrap(const LoginRegisterScreen(isLogin: false, showConfirmPassword: false)));
    expect(find.byType(TextFormField), findsNWidgets(2));
  });
}
