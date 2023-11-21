import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:specdoc/data/firebase_database.dart';
import 'package:specdoc/utils/colors.dart';
import 'package:specdoc/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Spec',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.green[800],
                      fontSize: 40,
                    ),
                  ),
                  const Text(
                    'Doc',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.black,
                      fontSize: 39,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome to SpecDoc !!',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Container(
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.darkGreen,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset('assets/images/undraw-removebg.png'),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              const Text(
                ' Your Ultimate Healthcare Companion!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGreen,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              const Text(
                'Instantly connect with top-notch doctors in every specialty, making healthcare personalized and hassle-free.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGreen,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: size.height * 0.11),
              const Text(
                'Lets get you started.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      showLoadingDialog(context);
                      UserCredential userCredential =
                          await FirebaseFuncs.signInWithGoogle();
                      User? user = userCredential.user;
                      print(user);
                      if (user != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        var snackbar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Some error occurred. Please try again.',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    child: SizedBox(
                      width: size.width / 2.3,
                      height: size.height * 0.054,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              scale: size.width * 0.04,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Google Sign In",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class LoadingAlertDialog extends StatelessWidget {
  const LoadingAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16.0),
          Text('Loading...'),
        ],
      ),
    );
  }
}

// Function to show the loading alert
void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible:
        false, // Set to true if you want to allow tapping outside to dismiss
    builder: (BuildContext context) {
      return LoadingAlertDialog();
    },
  );
}
