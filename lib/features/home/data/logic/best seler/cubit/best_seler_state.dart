part of 'best_seler_cubit.dart';

sealed class BestSelerState extends Equatable {
  const BestSelerState();

  @override
  List<Object?> get props => [];
}

class BestSelerInitial extends BestSelerState {}

class BestSelerLoading extends BestSelerState {}

class BestSelerSuccess extends BestSelerState {
  final List<BestSeler> bestSeler;

  const BestSelerSuccess({required this.bestSeler});

  @override
  List<Object?> get props => [bestSeler];
}

class BestSelerError extends BestSelerState {
  final String error;

  const BestSelerError({required this.error});
  @override
  List<Object?> get props => [error];
}
