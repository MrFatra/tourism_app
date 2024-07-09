import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/cubit/home_cubit.dart';
import 'package:tourism_app/repositories/destination.dart';
import 'package:tourism_app/screens/home/widgets/list_destinations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            return ListDestinations(destinations: state.destinations);
          } else if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text('Hmm... ada masalah kecil'),
          );
        },
      ),
    );
  }
}
