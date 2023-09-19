part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFetchXRBundleListSuccess extends HomeState {
  late final String result;

  HomeFetchXRBundleListSuccess(this.result);
}

class HomeFetchXRBundleListFailed extends HomeState {}

class HomeFetchStatsSuccess extends HomeState {
  late final String result;

  HomeFetchStatsSuccess(this.result);
}

class HomeFetchStatsFailed extends HomeState {}

class HomeFetchXRBundleFileSuccess extends HomeState {
  late final String result;

  HomeFetchXRBundleFileSuccess(this.result);
}

class HomeFetchXRBundleFileFailed extends HomeState {}

class HomeFetchWorkflowSuccess extends HomeState {
  late final WorkFlowInfo workFlowInfo;

  HomeFetchWorkflowSuccess(this.workFlowInfo);
}

class HomeFetchWorkflowFailed extends HomeState {}
