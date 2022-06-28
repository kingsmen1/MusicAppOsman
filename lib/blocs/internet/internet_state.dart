part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class connected extends InternetState {
  // final bool isConnected;

  // connected({required this.isConnected});
  // @override
  // List<Object> get props => [isConnected];
}

class disconnected extends InternetState {
  // final bool isConnected;

  // disconnected({required this.isConnected});
  // @override
  // List<Object> get props => [disconnected];
}
