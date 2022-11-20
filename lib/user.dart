import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late final StreamUserListController _userListController =
      StreamUserListController(
    client: StreamChat.of(context).client,
    limit: 25,
    filter: Filter.and(
      [Filter.notEqual('id', StreamChat.of(context).currentUser!.id)],
    ),
    sort: [
      const SortOption(
        'name',
        direction: 1,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _userListController.refresh(),
      child: StreamUserListView(
        controller: _userListController,
      ),
    );
  }
}
