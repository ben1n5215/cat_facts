import 'package:cat_facts/data/models/facts_and_images.dart';

abstract class HistoryState {}

class CatHistoryInitial extends HistoryState {}

class CatHistoryLoading extends HistoryState {}

class CatHistoryLoaded extends HistoryState {
  CatHistoryLoaded(this.history);

  final List<FactsAndImages> history;

}

class CatHistoryError extends HistoryState {
  CatHistoryError(this.error);

  final Object error;
}
