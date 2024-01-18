import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/Customized/blurredcircular.dart';
import '../appbar&drawer/appbar.dart';
import 'Pages/BotMessage.dart';
import 'Pages/UserMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<Widget> _messages = <Widget>[];
  late TabController _tabController;

  void _handleSubmitted(String text) {
    _textController.clear();

    // User message
    UserMessage userMessage = UserMessage(text: text);

    // Simulating bot reply after a delay
    Future.delayed(Duration(seconds: 2), () {
      BotMessage botReply = BotMessage(text: 'This is a bot reply');  // Replace with actual bot reply

      setState(() {
        _messages.insert(0, userMessage);  // Add user message to the list
        _messages.insert(0, botReply);  // Add bot reply to the list

      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Adjust the length as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(tabController: _tabController),
      body: Stack(
        children: [
          BlurredCircleBackground(isDark: Theme.of(context).brightness == Brightness.dark),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (_, int index) => _messages[index],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: _buildTextComposer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/Applogo/applogo.png',
              fit: BoxFit.contain,
              width: 45,
              height: 45,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                  hintText: 'Send a message',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.language, color: Color(0xFF000F3B)),
            onPressed: () {
              // Add your logic for the attach button here
            },
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFF000F3B)),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}



