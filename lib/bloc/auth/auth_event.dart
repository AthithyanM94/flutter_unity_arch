part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthRequestedEvent extends AuthEvent {
  final String username;
  final String password;

  AuthRequestedEvent(this.username, this.password);
}

class SignOffEvent extends AuthEvent {
  final String userID;

  SignOffEvent(this.userID);
}