import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:specdoc/data/firebase_database.dart';
import 'package:specdoc/utils/colors.dart';

class DoctorsListTile extends StatefulWidget {
  const DoctorsListTile(
      {super.key,
      required this.name,
      required this.email,
      required this.desc,
      required this.bookings});
  final String name;
  final String email;
  final String desc;
  final List<String> bookings;

  @override
  State<DoctorsListTile> createState() => _DoctorsListTileState();
}

class _DoctorsListTileState extends State<DoctorsListTile> {
  bool loading = false;
  void onTap() async {
    setState(() {
      loading = true;
    });
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFuncs().addBookings("${user?.email}", widget.email);
    var snackbar = SnackBar(
      backgroundColor: Colors.green[800],
      content: const Text(
        'Booked your appointment successfully !!',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    setState(() {
      loading = false;
      widget.bookings.add(widget.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(1, 1),
            blurRadius: 10,
            spreadRadius: 0.2,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green[800],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(1, 0),
                  blurRadius: 2,
                  spreadRadius: 0.1,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Description:\n${widget.desc}',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.darkGreen,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Get an appointment',
                      style: TextStyle(
                        color: AppColors.darkGreen,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                if (loading)
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green[800],
                        // border: Border.all(),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(1, 0),
                            blurRadius: 3,
                            spreadRadius: 0.2,
                          )
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!loading)
                  if (!widget.bookings.contains(widget.email))
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: size.height * 0.04,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green[800],
                          // border: Border.all(),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 0),
                              blurRadius: 3,
                              spreadRadius: 0.2,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                if (!loading)
                  if (widget.bookings.contains(widget.email))
                    Container(
                      height: size.height * 0.04,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          'Booked',
                          style: TextStyle(
                            color: AppColors.black.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
