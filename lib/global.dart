import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  String msgcount;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time,
      required this.msgcount});
}

List<ChatUsers> chatUsers = [
  ChatUsers(
      name: "Jane Russel",
      messageText: "Awesome Setup",
      imageURL: "images/1.png",
      time: "Now",
      msgcount: '3'),
  ChatUsers(
      name: "Glady's Murphy",
      messageText: "That's Great",
      imageURL: "images/2.png",
      time: "Yesterday",
      msgcount: '1'),
  ChatUsers(
      name: "Jorge Henry",
      messageText: "Hey where are you?",
      imageURL: "images/3.png",
      time: "31 Mar",
      msgcount: '4'),
  ChatUsers(
      name: "Philip Fox",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "images/4.png",
      time: "28 Mar",
      msgcount: '7'),
  ChatUsers(
      name: "Debra Hawkins",
      messageText: "Thankyou, It's awesome",
      imageURL: "images/5.png",
      time: "23 Mar",
      msgcount: '2'),
  ChatUsers(
      name: "Jacob Pena",
      messageText: "will update you in evening",
      imageURL: "images/6.png",
      time: "17 Mar",
      msgcount: ''),
  ChatUsers(
      name: "Andrey Jones",
      messageText: "Can you please share the file?",
      imageURL: "images/7.png",
      time: "24 Feb",
      msgcount: ''),
  ChatUsers(
      name: "John Wick",
      messageText: "How are you?",
      imageURL: "images/8.png",
      time: "18 Feb",
      msgcount: ''),
  ChatUsers(
      name: "John Wick",
      messageText: "Hi",
      imageURL: "images/9.png",
      time: "1 Jun",
      msgcount: ''),
  ChatUsers(
      name: "John Wick",
      messageText: "Hello",
      imageURL: "images/10.png",
      time: "8 Sep",
      msgcount: ''),
  ChatUsers(
      name: "John Wick",
      messageText: "Send your location",
      imageURL: "images/11.png",
      time: "7 Apr",
      msgcount: ''),
  ChatUsers(
      name: "John Wick",
      messageText: "Where are you?",
      imageURL: "images/12.png",
      time: "17 Dec",
      msgcount: ''),
  ChatUsers(
      name: "John Wick",
      messageText: "I'm at work roght now",
      imageURL: "images/13.png",
      time: "22 Nov",
      msgcount: ''),
  ChatUsers(
      name: "John Wick",
      messageText: "Good morning",
      imageURL: "images/14.png",
      time: "26 Jan",
      msgcount: ''),
];
Color black = const Color(0xff333333);
Color lightblue = const Color(0xffE5FAFF);
Color blue = const Color(0xff40CDFC);

const apiKey = "hz6bsypezq3t";

final client = StreamChatClient(apiKey, logLevel: Level.INFO);

final channel = client.channel(
  'messaging',
  id: 'Flutter',
);
