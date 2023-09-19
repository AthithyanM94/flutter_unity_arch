import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lume_ox_app/data/model/user_data.dart';
import 'package:lume_ox_app/repository/auth/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepo = AuthRepo();

  AuthBloc(): super (AuthInitial()) {
    on<AuthRequestedEvent>(_authRequestedEventListener);
    on<SignOffEvent>(_signOffRequestedEventListener);
  }

  FutureOr<void> _authRequestedEventListener (AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));
    emit(AuthSuccess(UserData()));

    // if (event is AuthRequestedEvent) {
    //   await _authRepo.signOn(event.username, event.password).onError((error, stackTrace) => emit(AuthFailed(error.toString()))).then((value) {
    //     UserData userData = UserData();
    //     userData.fromJson(value);
    //     if (userData.status == "true") {
    //       emit(AuthSuccess(userData));
    //     } else {
    //       emit(AuthFailed(userData.message!));
    //     }
    //   });
    // }
  }

  FutureOr<void> _signOffRequestedEventListener (AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (event is SignOffEvent) {
      await _authRepo.signOff(event.userID).onError((error, stackTrace) => emit(SignOffFailed(error.toString()))).then((value) {
        if (value["status"] == "true"){
          emit(SignOffSuccess(value["status"]));
        } else {
          emit(SignOffFailed(value["message"]));
        }
      });
    }
  }
}