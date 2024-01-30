import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Row(
      children: [
        Expanded(
          child: Container(
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
                    padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 5),
                    child: SingleChildScrollView(
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
          icon:

          Icon(Icons.keyboard_voice,), // Example icon
          onPressed: () {
            // Add your logic for the icon button here
          },
        ),
      ],
    );
  }
}



