import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryRed,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    // تنسيق الـ AppBar بناءً على تصميمك
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.deepBlack,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.deepBlack),
    ),

    // تنسيق الأزرار (Buttons) اللي في الـ Style Guide
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r), // نفس الـ Radius في تصميمك
        ),
        minimumSize: Size(double.infinity, 52.h), // طول موحد للأزرار
      ),
    ),

    // تنسيق النصوص (Text Theme)
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.primaryRed,
        fontSize: 22.sp,
        fontWeight: FontWeight.w900,
      ),
      bodyLarge: TextStyle(color: AppColors.deepBlack, fontSize: 16.sp),
      bodyMedium: TextStyle(color: AppColors.darkGrey, fontSize: 14.sp),
    ),

    // تنسيق الـ Input (TextFields) اللي في الـ Login/Sign up
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.yellow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.primaryRed, width: 1.w),
      ),
    ),
  );
}
