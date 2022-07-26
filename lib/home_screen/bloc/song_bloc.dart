import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/api/api_provider.dart';

import '../model/track_model.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final ApiProvider apiProvider;
  SongBloc(this.apiProvider) : super(SongInitial()) {
    on<LoadApiEvent>(_onLoadApi);
  }
  _onLoadApi(LoadApiEvent event, Emitter<SongState> emit) async {
    final apiResult = await apiProvider.getData();
    emit(SongLoaded(apiResult ?? []));
  }
}
