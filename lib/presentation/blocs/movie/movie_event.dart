part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {
  const MovieEvent();
}

class GetMoviePageEvent extends MovieEvent {}

class MoviePageLoaded extends MovieEvent {}

class MoviePagePlaying extends MovieEvent {}
