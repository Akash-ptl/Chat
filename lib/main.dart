import 'package:aplatform/chat.dart';
import 'package:aplatform/global.dart';
import 'package:aplatform/myapp.dart';
import 'package:flutter/material.dart';
import 'package:storyly_flutter/storyly_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const apiKey = "hz6bsypezq3t";
const userToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWthc2hwdGwifQ.idjEGcF4s9yYV-zJmajVsO36J6f7Ov57IHoYvkGd5MU";

// final apiKey = "b67pax5b2wdq";
// final userToken =
//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //StreamChatClient
  final client = StreamChatClient(apiKey, logLevel: Level.INFO);

  // Current user
  await client.connectUser(
    User(id: "akashptl"),
    userToken,
  );

  final channel = client.channel(
    'messaging',
    id: 'Flutter',
  );

  await channel.watch();
  runApp(MyApp(client: client, channel: channel));
}

// class MyApp extends StatelessWidget {
//   const MyApp(
//       {super.key, required Channel channel, required StreamChatClient client});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         '/': (context) => const MyHomePage(),
//         'chat': (context) => const Chat(),
//       },
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         highlightColor: Colors.transparent,
//         splashColor: Colors.transparent,
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//   });

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class ChatMessage {
//   String messageContent;
//   String messageType;
//   ChatMessage({required this.messageContent, required this.messageType});
// }

// class _MyHomePageState extends State<MyHomePage> {
//   static const storylyToken =
//       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NfaWQiOjg1ODQsImFwcF9pZCI6MTM1ODUsImluc19pZCI6MTQ3OTV9.Z1-a0dG2-049VCl6M36HSO-cjzTfgf6fQ_uXNnsnOME";

//   late StorylyViewController storylyViewController;

//   void onStorylyViewCreated(StorylyViewController storylyViewController) {
//     this.storylyViewController = storylyViewController;
//   }

//   List<ChatMessage> messages = [
//     ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
//     ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
//     ChatMessage(
//         messageContent: "Hey Kriss, I am doing fine dude. wbu?",
//         messageType: "sender"),
//     ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
//     ChatMessage(
//         messageContent: "Is there any thing wrong?", messageType: "sender"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             indicatorColor: Colors.blue,
//             labelColor: const Color(0xff40CDFC),
//             indicatorSize: TabBarIndicatorSize.label,
//             unselectedLabelColor: black,
//             tabs: const [
//               Tab(
//                 text: 'Chats',
//               ),
//               Tab(
//                 text: 'Calls',
//               ),
//             ],
//           ),
//           backgroundColor: const Color(0xffF5F5F5),
//           elevation: 0,
//           actions: [
//             const SizedBox(width: 10),
//             const CircleAvatar(
//               backgroundImage: AssetImage('images/11.png'),
//             ),
//             const SizedBox(width: 10),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Hey!',
//                   style: TextStyle(color: black, fontSize: 12),
//                 ),
//                 Text(
//                   'John',
//                   style: TextStyle(color: black, fontSize: 16),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Icon(
//               Icons.search,
//               color: black,
//             ),
//             const SizedBox(width: 10),
//             Icon(
//               Icons.menu,
//               color: black,
//             ),
//             const SizedBox(width: 10),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: h / 10,
//                 // color: Colors.red,
//                 margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
//                 child: StorylyView(
//                   onStorylyViewCreated: onStorylyViewCreated,
//                   androidParam: StorylyParam()
//                     ..storyGroupSize = 'small'
//                     // ..storyGroupTextIsVisible = false
//                     ..storyGroupPinIconColor = blue
//                     ..storyGroupTextIsVisible = true
//                     ..storylyId = storylyToken,
//                   iosParam: StorylyParam()..storylyId = storylyToken,
//                   storylyLoaded: (storyGroups, dataSource) {
//                     debugPrint(
//                         "storylyLoaded -> storyGroups: ${storyGroups.length}");
//                     debugPrint("storylyLoaded -> dataSource: $dataSource");
//                   },
//                   storylyLoadFailed: (errorMessage) =>
//                       debugPrint("storylyLoadFailed -> $errorMessage"),
//                   storylyActionClicked: (story) {
//                     debugPrint("storylyActionClicked -> ${story.title}");
//                   },
//                   storylyEvent: (event, storyGroup, story, storyComponent) {
//                     debugPrint("storylyEvent -> event: $event");
//                     debugPrint(
//                         "storylyEvent -> storyGroup: ${storyGroup?.title}");
//                     debugPrint("storylyEvent -> story: ${story?.title}");
//                     debugPrint(
//                         "storylyEvent -> storyComponent: $storyComponent");
//                   },
//                   storylyStoryShown: () => debugPrint("storylyStoryShown"),
//                   storylyStoryDismissed: () =>
//                       debugPrint("storylyStoryDismissed"),
//                   storylyUserInteracted: (storyGroup, story, storyComponent) {
//                     debugPrint(
//                         "userInteracted -> storyGroup: ${storyGroup.title}");
//                     debugPrint("userInteracted -> story: ${story.title}");
//                     debugPrint(
//                         "userInteracted -> storyComponent: $storyComponent");
//                   },
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: chatUsers.length,
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.only(top: 5),
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(right: 15, left: 15, bottom: 5),
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               Navigator.pushNamed(context, 'chat',
//                                   arguments: chatUsers[index]);
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: lightblue,
//                                 borderRadius: BorderRadius.circular(5)),
//                             height: h / 16,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: <Widget>[
//                                   Expanded(
//                                     child: Row(
//                                       children: <Widget>[
//                                         GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               Navigator.pushNamed(
//                                                   context, 'user',
//                                                   arguments: chatUsers[index]);
//                                             });
//                                           },
//                                           child: CircleAvatar(
//                                             backgroundImage: AssetImage(
//                                                 chatUsers[index].imageURL),
//                                             maxRadius: 22,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 10,
//                                         ),
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               Text(
//                                                 chatUsers[index].name,
//                                                 style: TextStyle(
//                                                     fontSize: 14, color: black),
//                                               ),
//                                               const SizedBox(
//                                                 height: 6,
//                                               ),
//                                               Text(
//                                                 chatUsers[index].messageText,
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.grey.shade600,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         chatUsers[index].time,
//                                         style: TextStyle(
//                                             fontSize: 12, color: black),
//                                       ),
//                                       (chatUsers[index].msgcount != '')
//                                           ? CircleAvatar(
//                                               radius: 8,
//                                               backgroundColor: blue,
//                                               child: Text(
//                                                 chatUsers[index].msgcount,
//                                                 style: const TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 10),
//                                               ),
//                                             )
//                                           : const CircleAvatar(
//                                               radius: 8,
//                                               backgroundColor:
//                                                   Colors.transparent,
//                                             ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: SizedBox(
//           height: h / 18,
//           child: FloatingActionButton(
//             backgroundColor: blue,
//             onPressed: () {
//               setState(() {});
//             },
//             child: const Icon(Icons.message),
//           ),
//         ),
//       ),
//     );
//   }
// }
