import 'package:flutter/material.dart';
import 'package:specdoc/data/hive_database.dart';

class CategoriesList extends ChangeNotifier {
  List<String> category = [];
  // List<String> category = [
  //   "General Medicine",
  //   "Pediatrics",
  //   "Dermatology",
  //   "Cardiology",
  //   "Orthopedics",
  //   "Gynecology",
  //   "Ophthalmology, ENT (Ear, Nose, and Throat)",
  //   "Neurology",
  //   "Psychiatry"
  // ];
  List<String> desc = [];
  // List<String> desc = [
  //   "Comprehensive care for common health issues.",
  //   "Specialized care for infant, children, and adolescents.",
  //   "Treatment of skin-related conditions and disorders.",
  //   "Focus on heart health and cardiovascular diseases.",
  //   "Dealing with musculoskeletal system issues and injuries.",
  //   "Women\"s reproductive health and wellness., Eye care and treatment of visual disorders.",
  //   "Specialized care for ear, nose, and throat issues.",
  //   "Diagnosis and treatment of neurological disorders.",
  //   "Mental health diagnosis and treatment."
  // ];

  final db = HiveDatabase();
  void getData() {
    if (db.getCategories().isNotEmpty) {
      category = db.getCategories();
    }
    print(category);
    if (db.getDesc().isNotEmpty) {
      desc = db.getDesc();
    }
    print(desc);
  }
}
