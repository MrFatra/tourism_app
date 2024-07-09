import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tourism_app/widgets/appbar.dart';

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({super.key, required this.images});
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Placeholder(
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) => Image.network(images[index]),
          ),
        ),
    );
  }
}
