import 'package:cat_facts/data/models/facts_and_images.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CatImageFactWidget extends StatelessWidget {
  const CatImageFactWidget({
    super.key,
    required this.factsAndImages,
  });

  final FactsAndImages factsAndImages;

  static const grey = Colors.grey;

  static const sizeOfFact = 30.0;
  static const sizeOfDate = 14.0;
  static const widthOfImage = 400.0;
  static const heightOfImage = 400.0;

  static const space = SizedBox(height: 10.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          factsAndImages.images,
          height: heightOfImage,
          width: widthOfImage,
        ),
        space,
        Text(
          factsAndImages.facts.facts,
          style: const TextStyle(fontSize: sizeOfFact),
        ),
        Text(
          'Created at: ${DateFormat('dd/MM/yyyy').format(factsAndImages.facts.createdAt)}',
          style: const TextStyle(fontSize: sizeOfDate, color: grey),
        )
      ],
    );
  }
}
