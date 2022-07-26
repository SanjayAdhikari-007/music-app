part of 'lyrics_bloc.dart';

abstract class LyricsState extends Equatable {
  const LyricsState();
  
  @override
  List<Object> get props => [];
}

class LyricsInitial extends LyricsState {}
