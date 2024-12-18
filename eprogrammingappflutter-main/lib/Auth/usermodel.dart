class UserModel {
  String? fullName;
  String? email;
  String? phone;
  String? category;
  String? profilepic;
  String? uid;
  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.category,
    required this.profilepic,
    required this.uid,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    fullName = map["fullName"];
    email = map["email"];
    phone = map["phone"];
    category = map["category"];
    profilepic = map["profilepic"];
    uid = map["uid"];
  }

  Map<String, dynamic> toMap() {
    return {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "category": category,
      "profilepic": profilepic,
      "uid": uid,
    };
  }
}
