part of 'ar_bloc.dart';

@immutable
abstract class ARState {}

class ARInitial extends ARState {}

class ARLoading extends ARState {}

class RecordAnalyticsSuccess extends ARState {
  late final String data;

  RecordAnalyticsSuccess(this.data);
}

class RecordAnalyticsFailed extends ARState {
  late final String error;

  RecordAnalyticsFailed(this.error);
}
