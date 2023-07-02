import 'package:cat_facts/data/models/facts_and_images.dart';

abstract class CatFactsState {}

class CatFactsInitial extends CatFactsState {}

class CatFactsLoading extends CatFactsState {}

class CatFactsLoaded extends CatFactsState {
  CatFactsLoaded({required this.factsAndImages});

  final FactsAndImages factsAndImages;
}

class CatFactsError extends CatFactsState {
  CatFactsError(this.error);

  final Object error;
}
