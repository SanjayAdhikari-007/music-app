part of 'secondsong_bloc.dart';

abstract class SecondsongState extends Equatable {
  const SecondsongState();

  @override
  List<Object> get props => [];
}

class SecondsongInitial extends SecondsongState {}

class SecondPageSongLoaded extends SecondsongState {
  final SecondPageTrackModel model;

  const SecondPageSongLoaded(this.model);
}
