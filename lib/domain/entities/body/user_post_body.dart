import 'dart:convert';

class UserPostBody {
  final String? name;
  final String? job;

  UserPostBody({
    this.name,
    this.job,
  });

  factory UserPostBody.fromRawJson(String str) =>
      UserPostBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserPostBody.fromJson(Map<String, dynamic> json) => UserPostBody(
        name: json["name"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
      };
}
