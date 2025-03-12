import 'package:bloc/bloc.dart';
import 'package:moofie/presentation/blocs/trailer/trailer_page_event.dart';
import 'package:moofie/presentation/blocs/trailer/trailer_page_state.dart';

class TrailerPageBloc extends Bloc<TrailerPageEvent, TrailerPageState> {
  TrailerPageBloc() : super((const TrailerPageState())) {
    on<TrailerPageLoaded>((event, emit) async {
      emit(TrailerPageLoading());
      try {} catch (e) {
        emit(TrailerPageFailed());
      }
    });

    on<TrailerPagePlaying>((event, emit) async {
      try {
        emit(TrailerPageSuccess());
      } catch (e) {
        emit(TrailerPageFailed());
      }
    });
  }
}
