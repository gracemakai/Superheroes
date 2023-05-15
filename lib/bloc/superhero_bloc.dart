import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/superhero_model.dart';
import '../services/superhero_repository.dart';

part 'superhero_event.dart';
part 'superhero_state.dart';


class SuperHeroBloc extends Bloc<SuperheroEvent, SuperHeroState>{

  final SuperHeroRepository superHeroRepository;

  SuperHeroBloc({required this.superHeroRepository}) : super(SuperHeroState()){
    on<SuperheroEvent> (_mapGetSuperHeroEventToState);
  }

  FutureOr<void> _mapGetSuperHeroEventToState(SuperheroEvent event, Emitter<SuperHeroState> emit)  async {

    try {
      emit(state.copyWith(status: SuperHeroStatus.loading));

      final sups = await superHeroRepository.searchSuperHero("a");

      print("sups list 2 $sups");
      emit(state.copyWith(
          status: SuperHeroStatus.success,
          superheros: sups
      ));
    }catch(error){
      emit(state.copyWith(status: SuperHeroStatus.error));
    }
  }
}