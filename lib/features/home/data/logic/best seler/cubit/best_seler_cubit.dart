import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_kentucky/core/networking/api_service.dart';
import 'package:new_kentucky/features/home/data/models/best_seler.dart';

part 'best_seler_state.dart';

class BestSelerCubit extends Cubit<BestSelerState> {
  final ApiService apiService;
  BestSelerCubit(this.apiService) : super(BestSelerInitial());
  List<BestSeler> bestSeler = [];

  Future<void> getBestSeler() async {
    try {
      emit(BestSelerLoading());

      final response = await apiService.get(url: "Menu");

      final List<dynamic> data = response.data;

      bestSeler = BestSeler.listFromJson(data);

      emit(BestSelerSuccess(bestSeler: bestSeler));
    } catch (e) {
      emit(BestSelerError(error: e.toString()));
    }
  }
}
