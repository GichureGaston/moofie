part of 'movie_bloc.dart';

enum MovieLoadingStatus { initial, loading, success, failure }

@immutable
final class MoviePageState {
  final MovieLoadingStatus status;
  const MoviePageState({this.status = MovieLoadingStatus.initial});
}

final class MoviePageInitial extends MoviePageState {}

final class MoviePageLoading extends MoviePageState {}

final class MoviePageSuccess extends MoviePageState {}

final class MoviePageFailed extends MoviePageState {}
