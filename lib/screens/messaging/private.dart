import 'package:muffesapp/screens/messaging/chat.dart';
import 'package:flutter/material.dart';

class PrivateChats extends StatelessWidget {
  const PrivateChats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChatComponent(
          username: "suggestied",
          textContent: "Ewaaa",
          profilePicture: "https://source.unsplash.com/random",
          story: true,
          storyWatched: true,
          newMessages: 0,
        );
      },
    );
  }
}
