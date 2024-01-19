part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ChangeThemeToLightMode extends ThemeEvent {}

class InitApp extends ThemeEvent {}

