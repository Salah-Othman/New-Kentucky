import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_kentucky/core/networking/api_service.dart';
import 'package:new_kentucky/core/theme/app_colors.dart';
import 'package:new_kentucky/features/home/data/logic/best%20seler/cubit/best_seler_cubit.dart';
import 'package:new_kentucky/shared/custom_text.dart';

class BestSellersWidget extends StatelessWidget {
  const BestSellersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BestSelerCubit(ApiService(Dio()))..getBestSeler(),
      child: BlocBuilder<BestSelerCubit, BestSelerState>(
        builder: (context, state) {
          if (state is BestSelerLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BestSelerSuccess) {
            final bestseler = state.bestSeler;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Top Rated',
                  size: 12.sp,
                  weight: FontWeight.w500,
                  color: AppColors.primaryRed,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Best Selers',
                      size: 16.sp,
                      weight: FontWeight.w700,
                      color: AppColors.deepBlack,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                        text: 'View Menu',
                        size: 14.sp,
                        weight: FontWeight.w700,
                        color: AppColors.primaryRed,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryRed,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.h),
                SizedBox(
                  height: 380,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                    ),
                    physics: ScrollPhysics(
                      parent: NeverScrollableScrollPhysics(),
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final bestSeler = bestseler[index];
                      return Container(
                        width: 200.w,
                        height: 160.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 200.w,
                              height: 110.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                                color: AppColors.darkGrey,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: bestSeler.imageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: AppColors.darkGrey,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.primaryRed,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        color: AppColors.darkGrey,
                                        child: Image.asset('assets/me.jpg'),
                                      ),
                                  memCacheHeight: 20,
                                  memCacheWidth: 20,
                                ),
                              ),
                            ),
                            Container(
                              width: 200.w,
                              height: 66.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.r),
                                  bottomRight: Radius.circular(12.r),
                                ),
                                color: Colors.white38,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: bestSeler.name,
                                      size: 14.sp,
                                      weight: FontWeight.w600,
                                      color: AppColors.deepBlack,
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text:
                                              '\$ ${bestSeler.price.toString()}',
                                          size: 14.sp,
                                          weight: FontWeight.w900,
                                          color: AppColors.deepBlack,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 40,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              color: AppColors.primaryRed,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.white,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is BestSelerError) {
            return Center(child: Text(state.error));
          } else {
            return Text('no data');
          }
        },
      ),
    );
  }
}
