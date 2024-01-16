import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../appbar&drawer/appbar.dart';



class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  late TabController _tabController;
  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync:this); // Adjust the length as needed
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(tabController: _tabController,),
      body: Stack(
        children: [
          // Background Image with Acrylic Blur
          Image.asset(
            'assets/background.jpeg', // Replace with your image path
            fit: BoxFit.fitHeight,
            width: double.infinity,
            height: double.infinity,
          ),
          // Acrylic Blur Effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          // Your Scaffold Content
          Scaffold(
            backgroundColor: Colors.transparent, // Make Scaffold background transparent
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
                //Divider(height: 1.0),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
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
              fit: BoxFit.contain, // Adjust the BoxFit property
              width: 45, // Set the width as per your requirement
              height: 45, // Set the height as per your requirement
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
            icon: Icon(FontAwesomeIcons.language, color:Color(0xFF000F3B)),
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

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('U', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('User', style: Theme.of(context).textTheme.headline6),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text(text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
