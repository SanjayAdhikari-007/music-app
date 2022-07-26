import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lyrics_event.dart';
part 'lyrics_state.dart';

class LyricsBloc extends Bloc<LyricsEvent, LyricsState> {
  LyricsBloc() : super(LyricsInitial()) {
    on<LyricsEvent>((event, emit) {});
  }
}
