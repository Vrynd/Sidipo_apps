class UserProfile {
  final String? uid;
  final String? fullname;
  final String? email;
  final String? photoUrl;

  UserProfile({this.uid, this.fullname, this.email, this.photoUrl});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'],
      fullname: json['fullname'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'fullname': fullname,
    'email': email,
    'photoUrl': photoUrl,
  };
}
