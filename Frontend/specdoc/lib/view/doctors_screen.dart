import 'package:flutter/material.dart';
import 'package:specdoc/data/firebase_database.dart';
import 'package:specdoc/utils/colors.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen(
      {super.key, required this.category, required this.description});
  final String category;
  final String description;

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  Map<String, dynamic>? doctors;
  bool loading = true;

  void getDoctors() async {
    setState(() {
      loading = true;
    });
    doctors = await FirebaseFuncs().getDoctorsData(widget.category);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.category,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            // color: AppColors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.darkGreen,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      widget.category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGreen,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGreen,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              'Doctor\'s to consult :',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
