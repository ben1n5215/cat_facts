import 'package:hive/hive.dart';

part 'facts.g.dart';

@HiveType(typeId: 0)
class Facts {
  @HiveField(0)
  final String facts;
  @HiveField(1)
  final DateTime createdAt;

  const Facts(this.facts, this.createdAt);

  String get fullName => facts;
}
