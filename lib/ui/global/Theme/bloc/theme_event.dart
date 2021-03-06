part of 'theme_bloc.dart';


abstract class ThemeEvent extends Equatable {
  const ThemeEvent([List props = const <dynamic>[]]):super();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;
  ThemeChanged({@required this.theme}):super([theme]);
}
