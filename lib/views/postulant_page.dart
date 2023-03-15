import 'package:flutter/material.dart';
import 'package:test_router_app/models/user.dart';
import 'package:test_router_app/widgets/user_list.dart';

class PostulantPage extends StatefulWidget {
  final String label;
  const PostulantPage({super.key, required this.label});

  @override
  State<PostulantPage> createState() => PostulantPageState();
}

class PostulantPageState extends State<PostulantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserList(
        users: [
          User(id: "1", name: 'John', email: 'johndoe@gmail.com'),
          User(id: "2", name: 'Jane', email: 'janeDoe&gmail.com'),
          User(id: "3", name: 'Jack', email: 'jackDoe@gmail.com'),
          User(id: "4", name: 'Jill', email: 'jillDoe@gmail.com'),
          User(id: "5", name: 'Jen', email: 'JenDoe@gmail.com'),
          User(id: "6", name: 'Jenny', email: 'JennyDoe@gmail.com'),
          User(id: "7", name: 'Jenifer', email: 'JeniferDoe@gmail.com'),
        ],
      ),
    );
  }
}
