import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/user_list_item.dart';
import 'second_screen.dart';

class ThirdScreen extends StatefulWidget {
  final String name;

  const ThirdScreen({required this.name});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late Future<void> _fetchUsersFuture;

  @override
  void initState() {
    super.initState();
    _fetchUsersFuture = Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  Future<void> _refreshUsers() async {
    await Provider.of<UserProvider>(context, listen: false).fetchUsers(isRefreshing: true);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
        child: RefreshIndicator(
          onRefresh: _refreshUsers,
          child: FutureBuilder(
            future: _fetchUsersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error loading users'));
              }

              if (userProvider.users.isEmpty) {
                return const Center(
                  child: Text(
                    'No More User',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: userProvider.users.length,
                itemBuilder: (context, index) {
                  return UserListItem(
                    user: userProvider.users[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            name: widget.name,
                            selectedUser: "${userProvider.users[index].firstName} ${userProvider.users[index].lastName}",
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
