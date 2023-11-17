import 'package:flutter/material.dart';
import 'package:specdoc/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SpecDoc',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            // color: AppColors.white,
            fontSize: 25,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Hii, Max !!',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             color: AppColors.black,
              //             fontSize: 22,
              //           ),
              //         ),
              //         Text(
              //           'We hope you feel good today.',
              //           style: TextStyle(
              //             color: AppColors.black,
              //             fontSize: 16,
              //           ),
              //         ),
              //       ],
              //     ),
              //     CircleAvatar(
              //       radius: 25,
              //       backgroundImage: AssetImage('assets/images/profile.jpg'),
              //     )
              //   ],
              // ),
              // SizedBox(height: size.height * 0.03),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.lightGrey.withOpacity(0.5),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: AppColors.darkGrey,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 16,
                    ),
                  ),
                  onSubmitted: (value) {
                    search = value;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              const Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.93,
                decoration: BoxDecoration(
                  color: AppColors.darkGreen.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 10),
                      const Text(
                        'fkljdsfjsjlfjsajfljdslkfjla;jdsjflsajkldfjsla;jfls;jkdl;jslfjslajfdljlsjf',
                        maxLines: 3,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
