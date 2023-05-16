// ignore_for_file: public_member_api_docs, sort_constructors_first
class Users {
  String? name;
  String? role;
  String? avatar;
  Users({
    this.name,
    this.role,
    this.avatar,
  });

  factory Users.fromjson(Map<String, dynamic> json) {
    return Users(
        name: json['name'], role: json['role'], avatar: json['avatar']);
  }
}
