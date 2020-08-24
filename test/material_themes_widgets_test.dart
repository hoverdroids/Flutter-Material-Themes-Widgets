import 'package:flutter_test/flutter_test.dart';

import 'file:///C:/Users/sprag/Google%20Drive%20(HoverDroids)/Code/Flutter/material_themes_widgets/lib/drawers/material_themes_widgets.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
