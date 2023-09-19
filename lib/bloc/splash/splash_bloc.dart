import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {

  final String dummyNav = "Login";

  SplashScreenBloc() : super(SplashInitial()) {
    on<NavigateToLoginEvent>(_delayedNavigateEventListener);
    on<NavigateToHomeEvent>(_delayedNavigateEventListener);
  }

  FutureOr<void> _delayedNavigateEventListener(
      SplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    emit(SplashLoading());

    await Future.delayed(const Duration(seconds: 2));
    emit(SplashLoaded(dummyNav));
  }
}
