import 'dart:convert';

import '../../../domain/entities/user/list_user_entity.dart';
import '../../../domain/entities/user/list_user_sub_data_entity.dart';

class ListUserModel extends ListUserEntity {
  final List<UserDataModel>? data;
  final Support? support;

  const ListUserModel({
    super.page,
    super.perPage,
    super.total,
    super.totalPages,
    this.data,
    this.support,
  }) : super(
          userdata: data,
        );

  factory ListUserModel.fromRawJson(String str) =>
      ListUserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? []
            : List<UserDataModel>.from(
                json["data"]!.map((x) => UserDataModel.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support?.toJson(),
      };
}

class Support {
  final String? url;
  final String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromRawJson(String str) => Support.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}

class UserDataModel extends ListUserSubDataEntity {
  UserDataModel({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.avatar,
  });

  factory UserDataModel.fromRawJson(String str) =>
      UserDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
