import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_kentucky/core/networking/api_service.dart';
import 'package:new_kentucky/core/theme/app_colors.dart';
import 'package:new_kentucky/features/home/data/logic/category_cubit.dart';
import 'package:new_kentucky/features/home/data/logic/category_state.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(ApiService(Dio()))..getCategory(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategorySuccess) {
            final categories = state.category;
            return SizedBox(
              height: 50.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: AppColors.primaryRed),
                      ),
                      child: Center(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.deepBlack,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is CategoryLoading) {
            return CircularProgressIndicator();
          } else if (state is CategoryError) {
            return Text(state.error);
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
