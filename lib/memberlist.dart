import 'package:aplatform/global.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MemberListPage extends StatefulWidget {
  const MemberListPage({Key? key}) : super(key: key);

  @override
  State<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {
  late final StreamMemberListController _memberListController =
      StreamMemberListController(
    // client: StreamChat.of(context).client,
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
    channel: channel,
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _memberListController.refresh(),
      child: StreamMemberListView(
        controller: _memberListController,
      ),
    );
  }
}
