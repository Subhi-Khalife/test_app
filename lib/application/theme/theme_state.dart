part of 'theme_bloc.dart';

enum AppLanguage { arabic, english }

extension GetLanguageTitle on AppLanguage {
  get lang {
    switch (this) {
      case AppLanguage.arabic:
        return "ar";
      case AppLanguage.english:
        return "en";
    }
  }

}

class ThemeState extends Equatable {
  const ThemeState({
    required this.themeData,
  });
  final MainColors themeData;
  ThemeState copyWith({
    MainColors? themeData,
    AppLanguage? appLanguage,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object?> get props => [themeData];
}
