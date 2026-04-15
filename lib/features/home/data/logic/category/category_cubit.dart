import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_kentucky/core/networking/api_service.dart';
import 'package:new_kentucky/features/home/data/logic/category/category_state.dart';
import 'package:new_kentucky/features/home/data/models/category_model.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ApiService apiService;

  CategoryCubit(this.apiService) : super(CategoryInitial());
  List<Category> category = [];

  Future<void> getCategory() async {
    try {
      emit(CategoryLoading());

      final response = await apiService.get(url: "Category");

      final List<dynamic> data = response.data;

      category = Category.listFromJson(data);

      emit(CategorySuccess(category: category));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }

  Future<void> selectCategory(String category) async {
    emit(CategorySelect(selectedCategory: category));
  }
}
