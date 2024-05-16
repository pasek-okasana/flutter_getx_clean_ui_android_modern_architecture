import '../../../core/network/api_endpoint.dart';
import '../../../core/network/api_provider.dart';
import '../../../core/network/api_request_interface.dart';
import '../../../domain/entities/body/user_post_body.dart';

enum UserApiType { fetchList, fetchDetail, post }

class UserApi extends APIRequestInterface {
  final UserApiType type;
  String? keyword;
  int? page;
  int? pageSize;
  dynamic dataBody;
  UserApi._({
    required this.type,
    this.keyword,
    this.page,
    this.pageSize,
    this.dataBody,
  });

  UserApi.fetchList(int page) : this._(type: UserApiType.fetchList, page: page);
  UserApi.post(UserPostBody body)
      : this._(type: UserApiType.post, dataBody: body.toJson());

  @override
  get body {
    switch (type) {
      case UserApiType.post:
        return dataBody;
      case UserApiType.fetchList:
      case UserApiType.fetchDetail:
        return null;
    }
  }

  @override
  String get baseUrl => ApiEndpoint.baseUrl;

  @override
  Map<String, String>? get headers => null;

  @override
  HTTPMethod get method {
    switch (type) {
      case UserApiType.fetchDetail:
      case UserApiType.fetchList:
        return HTTPMethod.get;
      case UserApiType.post:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case UserApiType.fetchDetail:
        return ApiEndpoint.userPath;
      case UserApiType.fetchList:
        return ApiEndpoint.userPath;
      case UserApiType.post:
        return ApiEndpoint.userPath;
    }
  }

  @override
  Map<String, String>? get query {
    switch (type) {
      case UserApiType.fetchList:
        return {"page": "$page"};
      case UserApiType.post:
      case UserApiType.fetchDetail:
        return null;
    }
  }

  @override
  String get endpoint => baseUrl + path;

  @override
  Future request() => APIProvider.instance.request(this);
}
