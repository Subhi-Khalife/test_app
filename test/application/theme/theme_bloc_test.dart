import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/application/theme/theme_bloc.dart';
import 'package:test_app/common/config/color/colors_app.dart';
import 'package:test_app/common/config/color/light_mode.dart';

void main() {
  late ThemeBloc themeBloc;
  setUp(() {
    themeBloc = ThemeBloc();
  });
  tearDown(() {
    themeBloc.close();
  });

  group("Check Theme change status", () {
    test("First state", () {
      expect(themeBloc.state, ThemeState(themeData: LightModeTheme()));
    });
    final state = [ThemeState(themeData: LightModeTheme())];
    blocTest(
      'Change Theme to light Mode',
      build: () => themeBloc,
      act: (ThemeBloc bloc) => bloc.add(ChangeThemeToLightMode()),
      expect: () => state,
      setUp: () {},
      verify: (_) {
        return ColorsApp.mainColorsApp == LightModeTheme();
      },
    );
  });
}
