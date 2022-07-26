import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  final String descriptionName;
  final String description;
  const DetailTile(
      {Key? key, required this.descriptionName, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          descriptionName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 27),
        ),
        const SizedBox(
          height: 17,
        )
      ],
    );
  }
}
