part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {

}

class HomeFetchXRBundleList extends HomeEvent{
  final String userID;

  HomeFetchXRBundleList(this.userID);
}

class HomeFetchStats extends HomeEvent{
  final String userID;

  HomeFetchStats(this.userID);
}

class HomeFetchXRBundleFile extends HomeEvent{
  final String userID;
  final String xrBundleID;

  HomeFetchXRBundleFile(this.userID, this.xrBundleID);
}

class HomeFetchWorkFlow extends HomeEvent{
  final String userID;
  final String xrBundleID;

  HomeFetchWorkFlow(this.userID, this.xrBundleID);
}