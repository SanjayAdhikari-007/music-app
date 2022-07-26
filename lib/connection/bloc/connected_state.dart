part of 'connected_bloc.dart';

abstract class ConnectedState extends Equatable {
  const ConnectedState();

  @override
  List<Object> get props => [];
}

class ConnectedInitialState extends ConnectedState {}

class ConnectedSucessState extends ConnectedState {}

class ConnectedFailureState extends ConnectedState {}
