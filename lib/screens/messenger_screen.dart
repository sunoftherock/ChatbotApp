import 'package:flutter/material.dart';
import '../datafiles/messages.dart';
import '../datafiles/replies.dart';
import 'dart:async';

class MessagesPage extends StatefulWidget {
  final String messagePartner;
  const MessagesPage(this.messagePartner);

  @override
  State<StatefulWidget> createState() {
    return MessagePageState(messagePartner);
  }
}

List ourMsgs;

class MessagePageState extends State<MessagesPage> {
  final String myName = "Allen";
  final String messagePartner;
  MessagePageState(this.messagePartner);

  TextEditingController messageTextEdittingController = TextEditingController();

  addMessage() {
    if (messageTextEdittingController.text != "") {
      String message = messageTextEdittingController.text;

      var time = DateTime.now().toString();

      var msg = {
        "senderID": myName,
        "receiverID": messagePartner,
        "body": message,
        "time": time,
      };

      // print(messages);
      messages.add(msg);
      // print(messages);

      messageTextEdittingController.text = "";

      setState(() {});

      var response =
          replies.where((reply) => reply["msg"] == msg["body"]).toList();

      if (response.length > 0) {
        msg = {
          "senderID": messagePartner,
          "receiverID": myName,
          "body": response[0]["response"],
          "time": DateTime.now().toString(),
        };

        // print(messages);

        Timer(Duration(seconds: 2), () {
          messages.add(msg);
          setState(() {});
        });

        // print(ourMsgs);
      }
    }
  }

  getMsg() {
    // print(messages);
    // print("handaling new msg");
    ourMsgs = messages
        .where((msg) =>
            (msg['senderID'] == myName &&
                msg['receiverID'] == messagePartner) ||
            (msg['senderID'] == messagePartner && msg['receiverID'] == myName))
        .toList();
    // print(ourMsgs);
  }

  Widget chatMessageTile(String message, bool sendByMe) {
    return Row(
      mainAxisAlignment:
          sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomRight:
                      sendByMe ? Radius.circular(0) : Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft:
                      sendByMe ? Radius.circular(24) : Radius.circular(0),
                ),
                color: sendByMe ? Colors.blue : Colors.green,
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              )),
        ),
      ],
    );
  }

  Widget chatMessages() {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 70, top: 16),
      itemCount: ourMsgs.length,
      itemBuilder: (context, index) {
        // print(index);
        return chatMessageTile(
            ourMsgs[index]["body"], myName == ourMsgs[index]["senderID"]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getMsg();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/pearicon.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Messages'),
            ),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            chatMessages(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: messageTextEdittingController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "type a message",
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.6))),
                    )),
                    GestureDetector(
                      onTap: () {
                        addMessage();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
