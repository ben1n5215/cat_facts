import 'package:cat_facts/data/models/facts.dart';
import 'package:cat_facts/data/models/facts_and_images.dart';
import 'package:cat_facts/data/repository/repository.dart';
import 'package:cat_facts/data/services/network_service.dart';

class RepositoryImpl implements Repository {
  final NetworkService networkService;

  RepositoryImpl(this.networkService);

  @override
  Future<Facts> getFacts() async => await networkService.getFacts();

  @override
  Future<String> getImage() async => await networkService.getImage();

  @override
  Future<List<FactsAndImages>> getHistory() async =>
      await networkService.getHistory();

  @override
  Future<void> saveFacts(FactsAndImages facts) async =>
      await networkService.saveFacts(facts);
}
