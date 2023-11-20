import 'package:flutter/material.dart';
import 'package:specdoc/data/firebase_database.dart';
import 'package:specdoc/models/doctors.dart';
import 'package:specdoc/services/apis.dart';
import 'package:specdoc/utils/colors.dart';
import 'package:specdoc/widgets/doctors_list_tile.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen(
      {super.key, required this.category, required this.description});
  final String category;
  final String description;

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  late Map<String, dynamic> doctors;
  List<Doctor> docs = [];
  bool loading = true;

  List<String> bookings = [];
  void getDoctors() async {
    setState(() {
      loading = true;
    });
    doctors = await FirebaseFuncs().getDoctorsData(widget.category);
    bookings = await FirebaseFuncs().getBookingsData(ApiCalls.email);
    if (doctors.isNotEmpty) {}
    doctors.forEach(
      (key, value) {
        var d = Doctor.fromMap(value);
        docs.add(d);
      },
    );
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
            (!loading)
                ? Column(
                    children: [
                      if (docs.isNotEmpty)
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: docs.length,
                          itemBuilder: (context, index) => DoctorsListTile(
                              bookings: bookings,
                              name: '${docs[index].name}',
                              email: '${docs[index].email}',
                              desc: '${docs[index].desc}'),
                          separatorBuilder: (context, index) => SizedBox(
                            height: size.height * 0.02,
                          ),
                        ),
                      if (docs.isEmpty)
                        const Text(
                          'No doctors present.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                            fontSize: 18,
                          ),
                        ),
                    ],
                  )
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
