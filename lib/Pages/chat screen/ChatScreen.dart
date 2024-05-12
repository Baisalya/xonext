import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:xonext/utils/AppTheme.dart';
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
  late ScrollController _scrollController;
  bool showScrollToBottomIcon = false;
  String appLogoPath="";
/*
  void _handleSubmitted(String text) {
    // Check if the text is empty
    if (text.trim().isEmpty) {
      return; // Do nothing if the text is empty
    }
    _textController.clear();

    // User message
    UserMessage userMessage = UserMessage(text: text);
    setState(() {
      _messages.insert(0, userMessage);  // Add user message to the list immediately
    });
    // Simulating bot reply after a delay
    Future.delayed(Duration(seconds: 2), () {
      String bot="Hey there! 👋 How's your day going?"
          " I hope it's been fantastic so far! By the way,"
          " have you checked out the latest updates on Byanjan? "
          "It's an incredible app designed to revolutionize "
          "how you experience Searching and exploring new Knowledge. 🍳✨";

      BotMessage botReply = BotMessage(text: bot);  // Replace with actual bot reply

      setState(() {
      //  _messages.insert(0, userMessage);  // Add user message to the list
        _messages.insert(0, botReply);  // Add bot reply to the list

      });
    });
  }
*/
  void _handleSubmitted(String text) {
    // Check if the text is empty
    if (text.trim().isEmpty) {
      return; // Do nothing if the text is empty
    }
    _textController.clear();

    // User message
    UserMessage userMessage = UserMessage(text: text);
    setState(() {
      _messages.insert(0, userMessage);  // Add user message to the list immediately
    });

    // Bot replies based on user input
    String botReply = getBotReply(text);

    // Simulating bot reply after a delay
    Future.delayed(Duration(seconds: 2), () {
      BotMessage botMessage = BotMessage(text: botReply);
      setState(() {
        _messages.insert(0, botMessage);  // Add bot reply to the list
      });
    });
  }

/***
 * testing chat replay
 * ****/
  String getBotReply(String userMessage) {
    // Mapping of user inputs to bot replies
    Map<String, String> replies = {
      'show me some code': 'Here is an example code snippet:\n\n```dart\nvoid main() {\n  print("Hello, world!");\n}\n```',
      'Product': 'Product: Iphone 15, Price:  71999.99, Image: https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/h/d/9/-original-imagtc2qzgnnuhxh.jpeg?q=70',
      'hey': 'Hey there! I hope it\'s been fantastic so far! By the way, have you checked out the latest updates on Byanjan? It\'s an incredible app designed to revolutionize how you experience searching and exploring new knowledge. 🍳✨',
      'hello': 'Hello there! I hope it\'s been fantastic so far! By the way, have you checked out the latest updates on Byanjan? It\'s an incredible app designed to revolutionize how you experience searching and exploring new knowledge. 🍳✨',      'hello': 'Hello there! I hope it\'s been fantastic so far! By the way, have you checked out the latest updates on Byanjan? It\'s an incredible app designed to revolutionize how you experience searching and exploring new knowledge. 🍳✨',
      'how are you': 'I\'m doing well, thank you!How about you?',



    };

    // Convert user input to lowercase for case-insensitive matching
    userMessage = userMessage.toLowerCase();

    // Check if the user's message matches any key in the map, return the corresponding reply
    for (var entry in replies.entries) {
      // Check for exact match
      if (userMessage.contains(entry.key)) {
        return entry.value;
      }

      // Fuzzy matching using string_similarity package
      var similarity = userMessage.similarityTo(entry.key);
      if (similarity > 0.7) { // Adjust threshold as needed
        return entry.value;
      }
    }

    // If no specific match is found, return a default response
    return "I'm still learning! 😄";
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      setState(() {
        // Check if scrolling is needed
        showScrollToBottomIcon =
            _scrollController.position.pixels > 100; // Adjust threshold as needed
      });
    });
  }

  @override
  Widget build(BuildContext context) {
     appLogoPath = AppTheme.getAppLogo(context);

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
                    controller: _scrollController, // Attach the controller to the ListView
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
          if (showScrollToBottomIcon)
            Positioned(
              bottom: 100,
              right: 8,
              child: IconButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(
                  Icons.arrow_circle_down_sharp,
                  size: 35,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 50, // Minimum height for the container
                  maxHeight: 200, // Maximum height for the container
                ),
                margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: AppTheme.chatcomposer(context),
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(color: AppTheme.borderColor(context)),
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
                    /*Container(
                    margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      appLogoPath,
                      fit: BoxFit.contain,
                      width: 45,
                      height: 45,
                    ),
                  ),*/
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            reverse: true,
                            child: TextField(
                              maxLines: null,
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
                      ),
                    ),

                    IconButton(
                      icon: Icon(Icons.translate, color: AppTheme.iconcolor(context)),
                      onPressed: () {
                        // Add your logic for the attach button here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: AppTheme.iconcolor(context)),
                      onPressed: () => _handleSubmitted(_textController.text),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.keyboard_voice,), // Example icon
              onPressed: () {
                // Add your logic for the icon button here
              },
            ),
          ],
        );
      },
    );
  }
}



