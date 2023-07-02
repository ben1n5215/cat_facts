import 'package:cat_facts/data/models/facts_and_images.dart';
import 'package:cat_facts/data/repository/repository.dart';
import 'package:cat_facts/presentation/main_screen/bloc/cat_facts_event.dart';
import 'package:cat_facts/presentation/main_screen/bloc/cat_facts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactsBloc extends Bloc<CatEvent, CatFactsState> {
  CatFactsBloc(this.repository) : super(CatFactsInitial()) {
    on<LoadingCatEvent>((event, emit) async {
      emit(CatFactsLoading());
      try {
        final images = await repository.getImage();
        final facts = await repository.getFacts();

        final factsAndImages = FactsAndImages(images, facts);
        emit(CatFactsLoaded(factsAndImages: factsAndImages));
        await repository.saveFacts(factsAndImages);
      } catch (e) {
        emit(CatFactsError(e));
      }
    });
  }

  final Repository repository;
}
