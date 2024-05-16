import 'package:equatable/equatable.dart';

import 'list_user_sub_data_entity.dart';

class ListUserEntity extends Equatable {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<ListUserSubDataEntity>? userdata;

  const ListUserEntity({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.userdata,
  });

  @override
  List<Object?> get props => [page, perPage, total, totalPages, userdata];
}
