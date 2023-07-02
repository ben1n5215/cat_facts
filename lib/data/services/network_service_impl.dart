import 'dart:convert';
import 'package:cat_facts/data/models/facts.dart';
import 'package:cat_facts/data/models/facts_and_images.dart';
import 'package:cat_facts/data/services/network_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

class NetworkServiceImpl implements NetworkService {
  NetworkServiceImpl() {
    Hive.registerAdapter(FactsAdapter());
    Hive.registerAdapter(FactsAndImagesAdapter());
  }

  static const _partOfImageLink = 'https://cataas.com';
  static const _imageLink = 'https://cataas.com/cat?json=true';
  static const _factsLink =
      'https://cat-fact.herokuapp.com/facts/random?animal_type=cat';

  static const _keyOfUrl = 'url';
  static const _keyOfFact = 'text';
  static const _keyOfBox = 'catBox';
  static const _keyOfDate = 'createdAt';
  static const _keyOfBoxFacts = 'catFact';

  @override
  Future<String> getImage() async {
    final url = Uri.parse(_imageLink);
    final response = await get(url);
    final jsonData = json.decode(response.body);
    final result = '$_partOfImageLink${jsonData[_keyOfUrl]}';
    return result;
  }

  @override
  Future<Facts> getFacts() async {
    final url = Uri.parse(_factsLink);
    final response = await get(url);
    final jsonData = json.decode(response.body);
    return Facts(jsonData[_keyOfFact], DateTime.parse(jsonData[_keyOfDate]));
  }

  @override
  Future saveFacts(FactsAndImages facts) async {
    final box = await Hive.openBox(_keyOfBox);
    final myList = box.get(_keyOfBoxFacts);
    if (myList != null) {
      myList.add(facts);
      await box.put(_keyOfBoxFacts, myList);
    } else {
      await box.put(_keyOfBoxFacts, [facts]);
    }
  }

  @override
  Future<List<FactsAndImages>> getHistory() async {
    final box = await Hive.openBox(_keyOfBox);
    final facts = List<FactsAndImages>.from(box.get(_keyOfBoxFacts));
    return facts;
  }
}
