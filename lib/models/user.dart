class AppUser {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? photoUrl;
  final String telephone;

  const AppUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photoUrl,
    required this.telephone,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['user_id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      telephone: map['telephone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'photoUrl': photoUrl,
      'telephone': telephone,
    };
  }
}
