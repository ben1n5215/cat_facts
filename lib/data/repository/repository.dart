import 'package:cat_facts/data/models/facts.dart';
import 'package:cat_facts/data/models/facts_and_images.dart';

abstract class Repository {
  Future<Facts> getFacts();

  Future<String> getImage();

  Future<void> saveFacts(FactsAndImages facts);

  Future<List<FactsAndImages>> getHistory();
}
