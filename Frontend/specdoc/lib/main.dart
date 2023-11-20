import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:specdoc/firebase_options.dart';
import 'package:specdoc/providers/provider.dart';
import 'package:specdoc/view/home_screen.dart';
import 'package:specdoc/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox("specdoc");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoriesList(),
        ),
      ],
      child: MaterialApp(
        title: 'SpecDoc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.lightGreen.withOpacity(0.3),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
