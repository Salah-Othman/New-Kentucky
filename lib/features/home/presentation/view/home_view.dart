import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_kentucky/core/theme/app_colors.dart';
import 'package:new_kentucky/core/theme/app_theme.dart';
import 'package:new_kentucky/features/home/presentation/widget/best_sellers_widget.dart';
import 'package:new_kentucky/features/home/presentation/widget/carousel_slider_widget.dart';
import 'package:new_kentucky/features/home/presentation/widget/category_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            'NEW KENTUCKY',
            style: AppTheme.lightTheme.textTheme.displayLarge,
          ),

          // centerTitle: true,
        ),
        leading: Row(
          children: [
            Icon(Icons.location_on, color: AppColors.primaryRed),
            SizedBox(width: 1.w),
            Text('Minya', style: AppTheme.lightTheme.textTheme.bodyLarge),
          ],
        ),
        leadingWidth: 100,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.deepBlack),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              /// offers
              CarouselSliderWidget(),
              SizedBox(height: 16.h),

              /// Category
              CategoryWidget(),
              SizedBox(height: 16.h),

              /// Best Sellers
              BestSellersWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
