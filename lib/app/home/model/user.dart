class UserModel {
  final String name;
  final String email;
  final String id;

  UserModel(
    this.name,
    this.id,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      data['name'],
      data['id'],
      data['email'],
    );
  }
}
