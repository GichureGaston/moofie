import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MoviePageState> {
  MovieBloc() : super(MoviePageState()) {
    on<GetMoviePageEvent>((event, emit) {
      emit(MoviePageState(status: MovieLoadingStatus.loading));
      emit(MoviePageState(status: MovieLoadingStatus.success));
    });
  }
}
