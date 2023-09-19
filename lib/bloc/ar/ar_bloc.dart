import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lume_ox_app/repository/auth/auth_repo.dart';

part 'ar_event.dart';

part 'ar_state.dart';

class ARBloc extends Bloc<AREvent, ARState> {
  final _authRepo = AuthRepo();

  ARBloc() : super(ARInitial()) {
    on<LogAnalyticsEvent>(_recordAnalyticsEventListener);
  }

  FutureOr<void> _recordAnalyticsEventListener(
      AREvent event, Emitter<ARState> emit) async {
    emit(ARLoading());

    await Future.delayed(const Duration(seconds: 5));
    emit(RecordAnalyticsSuccess("dummy data..."));
  }
}
