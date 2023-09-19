part of 'splash_bloc.dart';

@immutable
abstract class SplashScreenEvent {}

class NavigateToLoginEvent extends SplashScreenEvent {}
class NavigateToHomeEvent extends SplashScreenEvent {}


