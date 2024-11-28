class User {
  String id;
  String? name;
  String? email;
  String? mobileno;
  String? password;
  String? filename;
  String? filepath;
  String? activeFlag;
  String? deleteFlag;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    this.name,
    this.email,
    this.mobileno,
    this.password,
    this.filename,
    this.filepath,
    this.activeFlag,
    this.deleteFlag,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      mobileno: json['mobileno'],
      password: json['password'],
      filename: json['filename'],
      filepath: json['filepath'],
      activeFlag: json['activeFlag'],
      deleteFlag: json['deleteFlag'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Method to convert User instance to a map (if needed)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'mobileno': mobileno,
      'password': password,
      'filename': filename,
      'filepath': filepath,
      'activeFlag': activeFlag,
      'deleteFlag': deleteFlag,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
