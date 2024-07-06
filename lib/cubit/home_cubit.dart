import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/destination.dart';
import '../repositories/destination.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DestinationRepository destinationRepository;

  HomeCubit(this.destinationRepository) : super(HomeInitial());

  Future<void> loadDestinations() async {
    try {
      emit(HomeLoading());
      final destinations = await destinationRepository.getDestinations();
      emit(HomeLoaded(destinations));
    } catch (err) {
      emit(HomeError(err.toString()));
    }
  }
}
