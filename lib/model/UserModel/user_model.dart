class UserModel {
  final String? uid;
  final String? displayName;
  final String? email;
  final String? photoURL;
  final String? nickName; // Store the profile picture URL

  UserModel({
    this.uid,
    this.displayName,
    this.email,
    this.nickName,
    this.photoURL,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      displayName: map['displayName'],
      email: map['email'],
      nickName: map['nickName'],
      photoURL: map['photoURL'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'photoURL': photoURL,
      'nickName': nickName,
    };
  }
}
