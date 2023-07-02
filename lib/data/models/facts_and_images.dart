import 'package:cat_facts/data/models/facts.dart';
import 'package:hive/hive.dart';

part 'facts_and_images.g.dart';


@HiveType(typeId: 1)
class FactsAndImages {

  @HiveField(0)
  final String images;
  @HiveField(1)
  final Facts facts;

  FactsAndImages(this.images, this.facts);
}
