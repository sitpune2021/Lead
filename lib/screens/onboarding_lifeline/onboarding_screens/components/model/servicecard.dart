class ServiceCardd {
  final String id;
  final String service;
  final String filename;
  final String filepath;
  final String moduleId;
  final String categoryId;
  final String subcategoryId;

  ServiceCardd({
    required this.id,
    required this.service,
    required this.filename,
    required this.filepath,
    required this.moduleId,
    required this.categoryId,
    required this.subcategoryId,
  });

  // Factory constructor to create a ServiceCard object from JSON
  factory ServiceCardd.fromJson(Map<String, dynamic> json) {
    return ServiceCardd(
      id: json['_id'],
      service: json['service'],
      filename: json['filename'],
      filepath: json['filepath'],
      moduleId: json['moduleId'],
      categoryId: json['categoryId'],
      subcategoryId: json['subcategoryId'],
    );
  }

  // Method to convert a ServiceCard object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'service': service,
      'filename': filename,
      'filepath': filepath,
      'moduleId': moduleId,
      'categoryId': categoryId,
      'subcategoryId': subcategoryId,
    };
  }
}
