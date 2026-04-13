import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_kentucky/core/theme/app_colors.dart';
import 'package:new_kentucky/shared/custom_text.dart';

class BestSellersWidget extends StatelessWidget {
  const BestSellersWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 4,
            itemBuilder: (context, index) {
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
                        image: DecorationImage(
                          image: AssetImage('assets/me.jpg'),
                          fit: BoxFit.cover,
                        ),
                        color: AppColors.darkGrey,
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
                              text: 'Food Name',
                              size: 14.sp,
                              weight: FontWeight.w600,
                              color: AppColors.deepBlack,
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: '\$Price',
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
                                      borderRadius: BorderRadius.circular(12.r),
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
  }
}
