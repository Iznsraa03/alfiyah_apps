import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

Container mainCard() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        // color: AppColors.surface.withValues(alpha: 15.0),
        image: DecorationImage(
          image: AssetImage('assets/img/contoh.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              // color: AppColors.secondary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.secondary.withValues(alpha: 0.0),
                  AppColors.secondary.withValues(alpha: 50.0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Populer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Wedding Make Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ).copyWith(overlayColor: WidgetStatePropertyAll(AppColors.secondary.withValues(alpha: 30.0))),
                    child: Text(
                      'Booking Sekarang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }