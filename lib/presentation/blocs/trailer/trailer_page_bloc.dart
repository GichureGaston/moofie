import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trailer_page_event.dart';
part 'trailer_page_state.dart';

class TrailerPageBloc extends Bloc<TrailerPageEvent, TrailerPageState> {
  TrailerPageBloc() : super(TrailerPageInitial()) {
    on<TrailerPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
