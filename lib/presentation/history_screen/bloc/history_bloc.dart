import 'package:cat_facts/data/repository/repository.dart';
import 'package:cat_facts/presentation/history_screen/bloc/history_event.dart';
import 'package:cat_facts/presentation/history_screen/bloc/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatHistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  CatHistoryBloc(this.repository) : super(CatHistoryInitial()) {
    on<LoadingHistoryEvent>((event, emit) async {
      emit(CatHistoryLoading());
      try {
        final facts = await repository.getHistory();
        emit(CatHistoryLoaded(facts));
      } catch (e) {
        emit(CatHistoryError(e));
      }
    });
  }

  final Repository repository;
}
