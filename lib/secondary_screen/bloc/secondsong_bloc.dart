import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/api_provider.dart';
import '../model/model.dart';

part 'secondsong_event.dart';
part 'secondsong_state.dart';

class SecondsongBloc extends Bloc<SecondsongEvent, SecondsongState> {
  final ApiProvider apiProvider;

  SecondsongBloc(this.apiProvider) : super(SecondsongInitial()) {
    on<LoadSecondPageEvent>(_onLoadSecondPage);
  }

  _onLoadSecondPage(
      LoadSecondPageEvent event, Emitter<SecondsongState> emit) async {
    final apiResult =
        await apiProvider.getSecondPageData(trackId: event.trackId);
    emit(SecondPageSongLoaded(apiResult ??
        SecondPageTrackModel(
            songName: 'null',
            albumName: 'null',
            artistName: 'null',
            trackId: 0,
            isExplicit: false,
            rating: 0,
            lyrics: '')));
  }
}
