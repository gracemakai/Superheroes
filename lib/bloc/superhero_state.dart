
part of '../bloc/superhero_bloc.dart';


enum SuperHeroStatus { initial, success, error, loading }

extension SuperHeroStatusX on SuperHeroStatus {
  bool get isInitial => this == SuperHeroStatus.initial;
  bool get isSuccess => this == SuperHeroStatus.success;
  bool get isError => this == SuperHeroStatus.error;
  bool get isLoading => this == SuperHeroStatus.loading;
}

class SuperHeroState extends Equatable {
  final SuperHeroStatus status;
  final List<SuperHeroModel> supers;

  SuperHeroState(
      {this.status = SuperHeroStatus.initial, List<SuperHeroModel>? superheros})
      : supers = superheros ?? [];

  @override
  List<Object?> get props => [status, supers];

  SuperHeroState copyWith(
      {SuperHeroStatus? status, List<SuperHeroModel>? superheros}) {
    return SuperHeroState(
        status: status ?? this.status, superheros: superheros ?? supers);
  }
}
