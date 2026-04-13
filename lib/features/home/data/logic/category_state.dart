
import 'package:equatable/equatable.dart';
import 'package:new_kentucky/features/home/data/models/category_model.dart';
abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
 final List<Category> category;

   const CategorySuccess({required this.category});

  @override
  List<Object?> get props => [category];
}

class CategoryError extends CategoryState {
  final String error;

  const CategoryError({required this.error});
  @override
  List<Object?> get props => [error];
  
}

class CategorySelect extends CategoryState{
  final String selectedCategory;

 const CategorySelect({required this.selectedCategory});
  @override
  List<Object?> get props => [selectedCategory];
}