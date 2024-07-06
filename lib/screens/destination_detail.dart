import 'package:flutter/material.dart';

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({super.key, required this.images});
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) => Image.network(images[index]),
      ),
    );
  }
}
