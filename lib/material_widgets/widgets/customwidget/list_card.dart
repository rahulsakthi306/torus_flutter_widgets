import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/card.dart';

class CardList extends StatelessWidget {
  final List<String> sampleData;
  final String type;
  final String size;
  final String direction;

  const CardList({
    super.key,
    required this.sampleData,
    this.type = 'filled-circle',
    this.size = 'medium',
    this.direction = 'horizontal',
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = sampleData.map((data) {
      return TCard(
        type: type,
        size: size,
      );
    }).toList();

    return direction == 'horizontal'
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: cardList,
            ),
          )
        : Column(
            children: cardList,
          );
  }
}
