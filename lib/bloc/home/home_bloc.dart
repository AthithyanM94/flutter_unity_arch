import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:lume_ox_app/data/model/workflow_info.dart';
import 'package:lume_ox_app/repository/auth/auth_repo.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _authRepo = AuthRepo();

  HomeBloc() : super (HomeInitial()) {
    on<HomeFetchStats>(_fetchStatsEventListener);
    on<HomeFetchXRBundleFile>(_fetchXRBundleFileEventListener);
    on<HomeFetchXRBundleList>(_fetchXRBundleListEventListener);
    on<HomeFetchWorkFlow>(_fetchWorkflowEventListener);

  }

  FutureOr<void> _fetchXRBundleListEventListener (HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    await Future.delayed(const Duration(seconds: 2));
    emit(HomeFetchXRBundleListSuccess("all data dummy..."));
  }

  FutureOr<void> _fetchXRBundleFileEventListener (HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    await Future.delayed(const Duration(seconds: 2));
    emit(HomeFetchXRBundleFileSuccess("someurl://some"));
  }

  FutureOr<void> _fetchStatsEventListener (HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    await Future.delayed(const Duration(seconds: 2));
    emit(HomeFetchStatsSuccess("all data dummy..."));
  }

  FutureOr<void> _fetchWorkflowEventListener (HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    await Future.delayed(const Duration(seconds: 2));

    final String response =
        await rootBundle.loadString('assets/json/spartan_worflow.json');
    WorkFlowInfo workFlowInfo = WorkFlowInfo();
    workFlowInfo.fromJson(jsonDecode(response));

    emit(HomeFetchWorkflowSuccess(workFlowInfo));
  }

}