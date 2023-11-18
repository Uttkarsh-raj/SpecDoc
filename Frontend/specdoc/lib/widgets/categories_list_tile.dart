import 'package:flutter/material.dart';
import 'package:specdoc/utils/colors.dart';
import 'package:specdoc/view/doctors_screen.dart';

class CategoriesListTile extends StatelessWidget {
  const CategoriesListTile(
      {super.key, required this.title, required this.desc});
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                DoctorsScreen(category: title, description: desc),
          ),
        );
      },
      child: Container(
        width: size.width * 0.93,
        decoration: BoxDecoration(
          // color: AppColors.darkGreen.withOpacity(0.9),
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.darkGreen,
              AppColors.lightGreen,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.5),
              offset: const Offset(1, 1),
              blurRadius: 10,
              spreadRadius: 0.3,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.7,
                child: Text(
                  desc,
                  maxLines: 3,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
