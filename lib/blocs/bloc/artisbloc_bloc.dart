import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:music_artist_app_osman/repository/artist_repo.dart';

import '../../models/artist.dart';

part 'artisbloc_event.dart';
part 'artisbloc_state.dart';

class ArtistBloc extends Bloc<ArtisblocEvent, ArtisBlocState> {
  final ArtistRepo _artistRepo;
  ArtistBloc({required ArtistRepo artistrepo})
      : _artistRepo = artistrepo,
        super(ArtistLoading()) {
    on<LoadArtist>(_loadArtist);
  }

  _loadArtist(LoadArtist event, Emitter<ArtisBlocState> emit) async {
    emit(ArtistLoading());
    final artistList = await _artistRepo.getArtist();
    emit(ArtistLoaded(artistList: artistList));
  }
}
