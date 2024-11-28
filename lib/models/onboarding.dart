class Onboarding {
  final String id;
  final String imagePath;
  final String label;

  Onboarding({required this.id, required this.imagePath, required this.label});

  factory Onboarding.fromJson(Map<String, dynamic> json) {
    return Onboarding(
      id: json['_id'],
      imagePath: json['filename'],
      label: json['module'],
    );
  }
}
