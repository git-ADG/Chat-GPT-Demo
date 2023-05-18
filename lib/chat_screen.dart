import 'package:chat_gpt/chatmessage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  final TextEditingController _controller=TextEditingController();
  final List<ChatMessage> _messages=[];
  void _sendMessage(){
    ChatMessage _message=ChatMessage(text: _controller.text, sender: "user");

    setState(() {
      _messages.insert(0, _message);
    });

    _controller.clear();
  }

  Widget _buildTextComposer(){
    return Row(
      children: [
        Expanded(child: TextField(
          controller: _controller,
        onSubmitted: (value) => _sendMessage(),
        decoration: const InputDecoration.collapsed(hintText: "Send a message"),
        )
        ),
        IconButton(
            onPressed: ()=> _sendMessage(),
            icon: const Icon(Icons.send)
        )
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
      AppBar(
        title: const Text("ChatGPT Demo"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(child: ListView.builder(
              reverse: true,
              padding: Vx.m8,
              itemCount: _messages.length,
                itemBuilder: (context, index) {
              return _messages[index];
            }
            )
            ),
            Container(
              decoration: BoxDecoration(
                color: context.cardColor,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),

    );
  }
}
