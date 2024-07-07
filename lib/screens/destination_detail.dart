import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({super.key, required this.images});
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 25,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          leading: SizedBox(),
          leadingWidth: 25,
          title: Text('Destinasi Pariwisata'),
          actions: [
            ResponsiveVisibility(
              visible: false,
              visibleConditions: [Condition.largerThan(name: MOBILE)],
              child: Container(
                margin: EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => {},
                      child: Text('Home'),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Text('About'),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Text('Contact'),
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveVisibility(
              visible: false,
              visibleConditions: [Condition.smallerThan(name: TABLET)],
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text('Home'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.info),
                            title: Text('About'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.contact_mail),
                            title: Text('Contact'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      body: Placeholder(
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) => Image.network(images[index]),
        ),
      ),
    );
  }
}
