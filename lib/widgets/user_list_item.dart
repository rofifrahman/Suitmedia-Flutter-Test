import 'package:flutter/material.dart';
import '../models/user.dart';

class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserListItem({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
          title: Text('${user.firstName} ${user.lastName}'),
          subtitle: Text(user.email),
          onTap: onTap,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
