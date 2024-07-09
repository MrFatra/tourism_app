import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tourism_app/cubit/home_cubit.dart';
import 'package:tourism_app/helper/constant.dart';
import 'package:tourism_app/repositories/destination.dart';
import 'destination_detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> isHoveringList = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(DestinationRepository())..loadDestinations(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveValue<int>(
                  context,
                  defaultValue: 1,
                  conditionalValues: [
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
              itemCount: state.destinations.length,
              itemBuilder: (context, index) {
                while (isHoveringList.length <= index) {
                  isHoveringList.add(false);
                }
                return MouseRegion(
                  onHover: (event) {
                    setState(() {
                      isHoveringList[index] = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      isHoveringList[index] = false;
                    });
                  },
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DestinationDetail(
                          images: state.destinations[index].images,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    ),
                                    child: Image.network(
                                      state.destinations[index].images[0],
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10))),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Lihat Selengkapnya',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(Icons.arrow_forward,
                                              color: Colors.white, size: 18)
                                        ],
                                      ),
                                    ),
                                  )
                                      .animate(
                                          target: isHoveringList[index] ? 1 : 0)
                                      .flipV(
                                          duration: 200.ms,
                                          alignment: Alignment(0.9, 0)),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state.destinations[index].name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      state.destinations[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text('Press the button to re-fetching'),
          );
        },
      ),
    );
  }
}
