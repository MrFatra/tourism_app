import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tourism_app/models/destination.dart';
import 'package:tourism_app/screens/destination_detail.dart';
import 'package:tourism_app/screens/home/widgets/card.dart';

class ListDestinations extends StatelessWidget {
  final List<Destination> destinations;
  final ValueNotifier<List<bool>> isHoveringList;

  ListDestinations({required this.destinations, super.key})
      : isHoveringList = ValueNotifier<List<bool>>(
            List.generate(destinations.length, (index) => false));

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveValue<int>(
          context,
          defaultValue: 1,
          conditionalValues: const [
            Condition.smallerThan(
              name: TABLET,
              value: 1,
            ),
            Condition.equals(
              name: TABLET,
              value: 2,
            ),
            Condition.largerThan(
              name: TABLET,
              value: 3,
            ),
          ],
        ).value,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        return ValueListenableBuilder<List<bool>>(
          valueListenable: isHoveringList,
          builder: (context, hoverList, child) => MouseRegion(
            onHover: (event) {
              hoverList[index] = true;
              isHoveringList.value = List.from(hoverList);
            },
            onExit: (event) {
              hoverList[index] = false;
              isHoveringList.value = List.from(hoverList);
            },
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DestinationDetail(
                    images: destinations[index].images,
                  ),
                ),
              ),
              child: DestinationCard(
                hoverList: hoverList[index],
                destination: destinations[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
