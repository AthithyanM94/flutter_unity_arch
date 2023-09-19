part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  late final UserData userData;

  AuthSuccess(this.userData);
}

class AuthFailed extends AuthState {
  late final String error;

  AuthFailed(this.error);
}

class SignOffSuccess extends AuthState {
  late final String status;

  SignOffSuccess(this.status);
}

class SignOffFailed extends AuthState {
  late final String error;

  SignOffFailed(this.error);
}
