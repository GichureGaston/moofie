import 'package:equatable/equatable.dart';

abstract class TrailerPageEvent extends Equatable {
  const TrailerPageEvent();
}

class TrailerPageLoaded extends TrailerPageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TrailerPagePlaying extends TrailerPageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
