part of 'artisbloc_bloc.dart';

abstract class ArtisBlocState extends Equatable {}

class ArtistLoading extends ArtisBlocState {
  @override
  List<Object?> get props => [];
}

class ArtistLoaded extends ArtisBlocState {
  final List<Artist> artistList;

  ArtistLoaded({required this.artistList});
  @override
  List<Object?> get props => [artistList];
}
