part of 'ar_bloc.dart';

@immutable
abstract class AREvent {}

class LogAnalyticsEvent extends AREvent {
  final String userID;
  final String recordedAnalytics;

  LogAnalyticsEvent(this.userID, this.recordedAnalytics);
}
