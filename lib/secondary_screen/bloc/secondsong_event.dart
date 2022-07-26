part of 'secondsong_bloc.dart';

abstract class SecondsongEvent extends Equatable {
  const SecondsongEvent();

  @override
  List<Object> get props => [];
}

class LoadSecondPageEvent extends SecondsongEvent {
  final int trackId;

  const LoadSecondPageEvent(this.trackId);
  @override
  List<Object> get props => [trackId];
}
