import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/user_page_response.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  int _currentPage = 1;

  List<User> get users => _users;

  Future<void> fetchUsers({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _users.clear();
      _currentPage++;
    }

    final url = Uri.parse('https://reqres.in/api/users?page=$_currentPage&per_page=10');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final userPageResponse = UserPageResponse.fromJson(data);
      _users.clear();
      _users.addAll(userPageResponse.users);
      notifyListeners();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
