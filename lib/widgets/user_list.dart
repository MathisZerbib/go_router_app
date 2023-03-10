import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router_app/models/user.dart';

class UserList extends StatefulWidget {
  final List users;
  const UserList({super.key, required this.users});

  @override
  State<UserList> createState() => _UserListState();
}

Widget _buildUserItem(User user, BuildContext context) {
  return ListTile(
    title: Text(user.name),
    subtitle: Text(user.email),
    leading: CircleAvatar(
      backgroundImage: NetworkImage("https://picsum.photos/id/${user.id}/200"),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Colors.grey,
    ),
    onTap: () => context.goNamed('postulant', params: {'id': user.id}),
  );
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var user in widget.users) _buildUserItem(user, context),
      ],
    );
  }
}
