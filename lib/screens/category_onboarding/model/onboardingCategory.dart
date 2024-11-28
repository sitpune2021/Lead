// class nboardingCategory {
//   final String id;
//   final String category;
//   final String moduleID;
//   final String filename;
//   final String filepath;

//   onboardingCategory({
//     required this.id,
//     required this.category,
//     required this.moduleID,
//     required this.filename,
//     required this.filepath,
//   });

//   // Factory constructor to create an instance from JSON
//   factory onboardingCategory.fromJson(Map<String, dynamic> json) {
//     return onboardingCategory(
//       id: json['_id'],
//       category: json['category'],
//       moduleID: json['moduleID'],
//       filename: json['filename'],
//       filepath: json['filepath'],
//     );
//   }

//   // Convert an instance to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'category': category,
//       'moduleID': moduleID,
//       'filename': filename,
//       'filepath': filepath,
//     };
//   }
// }

class OnboardingCategory {
  final String id;
  final String category;
  final String moduleID;
  final String filename;
  final String filepath;

  OnboardingCategory({
    required this.id,
    required this.category,
    required this.moduleID,
    required this.filename,
    required this.filepath,
  });

  factory OnboardingCategory.fromJson(Map<String, dynamic> json) {
    return OnboardingCategory(
      id: json['_id'],
      category: json['category'],
      moduleID: json['moduleId'],
      filename: json['filename'],
      filepath: json['filepath'],
    );
  }
}
