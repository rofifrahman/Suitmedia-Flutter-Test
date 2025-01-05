import 'user.dart';

class UserPageResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> users;

  UserPageResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.users,
  });

  factory UserPageResponse.fromJson(Map<String, dynamic> json) {
    return UserPageResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      users: List<User>.from(json['data'].map((user) => User.fromJson(user))),
    );
  }
}
