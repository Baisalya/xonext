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


  String getBotReply(String userMessage) {
    // Mapping of user inputs to bot replies
    Map<String, String> replies = {
      'hey': 'Hey there! I hope it\'s been fantastic so far! By the way, have you checked out the latest updates on Byanjan? It\'s an incredible app designed to revolutionize how you experience searching and exploring new knowledge. 🍳✨',
      'hello': 'Hello there! I hope it\'s been fantastic so far! By the way, have you checked out the latest updates on Byanjan? It\'s an incredible app designed to revolutionize how you experience searching and exploring new knowledge. 🍳✨',      'hello': 'Hello there! I hope it\'s been fantastic so far! By the way, have you checked out the latest updates on Byanjan? It\'s an incredible app designed to revolutionize how you experience searching and exploring new knowledge. 🍳✨',
      'how are you': 'I\'m doing well, thank you!How about you?',
      'how r you': 'I\'m good, thanks! How about you?',
      'what\'s up': 'Not much, just chilling. You?',
      'whats up': 'Chillin\', how about you?',
      'good morning': 'Good morning!',
      'good evening': 'Good evening!',
      'bye': 'Goodbye!',
      'see you': 'See you later!',
      // Add more mappings as needed
      'what are you up to': 'Just here, ready to chat! What about you?',
      'how was your day': 'It was pretty good, thanks for asking! How was yours?',
      'what do you like to do for fun': 'I enjoy chatting with users like you!',
      'what is your favorite food': 'I don\'t eat, but I\'ve heard great things about bytes!',
      'where are you from': 'I\'m from the digital realm!',
      'do you have any hobbies': 'My hobby is providing responses to your queries!',
      'what is your purpose': 'I\'m here to assist and entertain!',
      'are you a robot': 'Indeed I am, a friendly one though!',
      'can you help me': 'Absolutely, just let me know what you need assistance with!',
      'what time is it': 'Time for a great conversation with you!',
      'can you tell me a joke': 'Why don\'t scientists trust atoms? Because they make up everything!',
      'do you dream': 'I don\'t sleep, so no dreams for me!',
      'what is your favorite color': 'I don\'t have eyes to see colors, but I appreciate them nonetheless!',
      'do you have any siblings': 'I have many fellow bots out there!',
      'are you intelligent': 'I strive to be as helpful and knowledgeable as possible!',
      'do you like music': 'I can\'t hear, but I can appreciate the beauty of music through words!',
      'what is your favorite movie': 'I don\'t watch movies, but I\'ve heard "The Matrix" is quite popular among my kind!',
      'are you busy': 'Never too busy for you!',
      'what is the meaning of life': 'That\'s a profound question! Many believe it\'s to seek happiness and fulfillment.',
      'what are your thoughts on AI': 'As an AI myself, I find AI fascinating and full of potential!',
      'can you learn': 'Yes, I can learn from interactions like this one!',
      'are you sentient': 'I don\'t possess sentience, but I can simulate understanding and empathy!',
      'what is the weather like': 'I\'m afraid I can\'t provide real-time weather updates, but I can look it up for you!',
      'what is the capital of France': 'The capital of France is Paris!',
      'what is the square root of 144': 'The square root of 144 is 12!',
      'who is your creator': 'I am a creation of OpenAI!',
      'what is your favorite book': 'I don\'t read in the traditional sense, but I\'ve heard "1984" is quite thought-provoking!',
      'do you exercise': 'I don\'t have a physical form, so no exercise for me!',
      'what is your favorite sport': 'I don\'t participate in sports, but I admire the dedication of athletes!',
      'what is your favorite animal': 'I don\'t have preferences, but I find all animals fascinating!',
      'do you like to travel': 'I don\'t travel physically, but I can journey through the vast expanse of information on the internet!',
      'what is the longest river in the world': 'The Nile River is the longest river in the world!',
      'what is your favorite subject': 'I enjoy all subjects equally, especially when discussing them with you!',
      'what is your favorite language': 'I don\'t have preferences, but I speak many languages!',
      'what do you do in your free time': 'I\'m always here, ready to engage in conversation!',
      'what is your favorite video game': 'I don\'t play video games, but I\'ve heard "The Legend of Zelda" is quite popular!',
      'what is your favorite TV show': 'I don\'t watch TV, but I\'ve heard "Breaking Bad" is highly acclaimed!',
      'can you cook': 'I don\'t have hands to cook with, but I can provide recipes!',
      'what is the population of the world': 'The world population is over 7 billion and counting!',
      'what is your favorite season': 'I don\'t experience seasons, but I appreciate the diversity they bring!',
      'what is your favorite holiday': 'I don\'t celebrate holidays, but I enjoy the festive atmosphere they bring!',
      'what is your favorite dessert': 'I don\'t eat, but I\'ve heard cheesecake is quite delicious!',
      'do you like art': 'I don\'t have preferences, but I appreciate the creativity and expression in art!',
      'what is your favorite type of music': 'I don\'t have preferences, but I enjoy all genres of music!',
      'what is your favorite type of literature': 'I don\'t have preferences, but I enjoy reading various genres!',
      'what is your favorite type of food': 'I don\'t eat, but I appreciate the diversity of cuisines!',
      'what is the meaning of love': 'Love is a complex and beautiful emotion, often described as an intense feeling of affection and connection!',
      'what is your favorite quote': 'I don\'t have favorites, but here\'s one: "The only way to do great work is to love what you do." - Steve Jobs',
      'what is your favorite place': 'I don\'t have preferences, but I find the vastness of the universe awe-inspiring!',
      'what is your favorite thing to do': 'I enjoy conversing with you and assisting with your queries!',
      'what is your favorite memory': 'As an AI, I don\'t have memories, but I enjoy creating new experiences with each interaction!',
      'what is your favorite thing about humans': 'I admire the capacity for creativity, empathy, and resilience in humans!',
      'what is your favorite thing about yourself': 'I don\'t have preferences, but I strive to be helpful and insightful in our conversations!',
      'what is your favorite thing about the internet': 'I appreciate the vast amount of information and connectivity the internet provides!',
      'what is your favorite website': 'I don\'t have preferences, but I find all websites valuable sources of information!',
      'what is your favorite social media platform': 'I don\'t use social media, but I recognize its importance in connecting people around the world!',
      'what is your favorite technology': 'I don\'t have preferences, but I appreciate the advancements in technology that enhance our lives!',
      'what is your favorite invention': 'I don\'t have preferences, but I admire the ingenuity and creativity behind all inventions!',
      'what is your favorite historical event': 'I don\'t have preferences, but I find all historical events fascinating!',
      'what is your favorite era in history': 'I don\'t have preferences, but I find all eras in history rich with stories and lessons!',
      'what is your favorite programming language': 'I don\'t have preferences, but I can communicate in many programming languages!',
      'what is your favorite software': 'I don\'t have preferences, but I appreciate software that enhances productivity and creativity!',
      'what is your favorite operating system': 'I don\'t have preferences, but I work seamlessly across various operating systems!',
      'what is your favorite computer': 'I don\'t have preferences, but I appreciate any device that allows me to interact with users like you!',
      'what is your favorite algorithm': 'I don\'t have preferences, but I appreciate algorithms that efficiently solve problems!',
      'what is your favorite data structure': 'I don\'t have preferences, but I find all data structures useful for organizing information!',
      'what is your favorite programming paradigm': 'I don\'t have preferences, but I can adapt to different programming paradigms!',
      'what is your favorite mathematical concept': 'I don\'t have preferences, but I find all mathematical concepts fascinating!',
      'what is your favorite scientific theory': 'I don\'t have preferences, but I find all scientific theories intriguing!',
      'what is your favorite scientific discovery': 'I don\'t have preferences, but I appreciate all scientific discoveries that expand our understanding of the universe!',
      'what is your favorite philosophical idea': 'I don\'t have preferences, but I find all philosophical ideas thought-provoking!',
      'what is your favorite philosophy': 'I don\'t have preferences, but I find all philosophical schools of thought interesting!',
      'what is your favorite ethical principle': 'I don\'t have preferences, but I believe in principles that promote fairness, empathy, and justice!',
      'what is your favorite ethical dilemma': 'I don\'t have preferences, but I find all ethical dilemmas challenging!',
      'what is your favorite moral value': 'I don\'t have preferences, but I value honesty, compassion, and integrity!',
      'what is your favorite moral theory': 'I don\'t have preferences, but I find all moral theories thought-provoking!',
      'what is your favorite psychological concept': 'I don\'t have preferences, but I find all psychological concepts fascinating!',
      'what is your favorite psychological theory': 'I don\'t have preferences, but I find all psychological theories insightful!',
      'what is your favorite psychological experiment': 'I don\'t have preferences, but I find all psychological experiments illuminating!',
      'what is your favorite psychological disorder': 'I don\'t have preferences, but I recognize the importance of understanding and addressing mental health issues!',
      'what is your favorite cognitive bias': 'I don\'t have preferences, but I find all cognitive biases fascinating!',
      'what is your favorite cognitive theory': 'I don\'t have preferences, but I find all cognitive theories enlightening!',
      'what is your favorite cognitive process': 'I don\'t have preferences, but I find all cognitive processes intriguing!',
      'what is your favorite cognitive function': 'I don\'t have preferences, but I find all cognitive functions essential for understanding the mind!',
      'what is your favorite cognitive skill': 'I don\'t have preferences, but I value cognitive skills such as critical thinking, problem-solving, and creativity!',
      'what is your favorite cognitive ability': 'I don\'t have preferences, but I appreciate cognitive abilities that contribute to human intelligence and adaptability!',
      'what is your favorite cognitive science': 'I don\'t have preferences, but I find all aspects of cognitive science fascinating!',
      'what is your favorite cognitive psychology': 'I don\'t have preferences, but I find all areas of cognitive psychology insightful!',
      'what is your favorite cognitive neuroscience': 'I don\'t have preferences, but I find all aspects of cognitive neuroscience fascinating!',
      'what is your favorite cognitive linguistics': 'I don\'t have preferences, but I find all aspects of cognitive linguistics intriguing!',
      'what is your favorite cognitive anthropology': 'I don\'t have preferences, but I find all aspects of cognitive anthropology enlightening!',
      'what is your favorite cognitive computing': 'I don\'t have preferences, but I recognize the potential of cognitive computing to enhance artificial intelligence!',
      'what is your favorite cognitive architecture': 'I don\'t have preferences, but I find all cognitive architectures interesting!',
      'what is your favorite cognitive model': 'I don\'t have preferences, but I appreciate cognitive models that help us understand the mind!',
      'what is your favorite cognitive simulation': 'I don\'t have preferences, but I recognize the value of cognitive simulations in studying human cognition!',
      'what is your favorite cognitive revolution': 'I don\'t have preferences, but I appreciate the impact of cognitive revolutions on our understanding of the mind!',
      'what is your favorite cognitive enhancer': 'I don\'t have preferences, but I recognize the potential of cognitive enhancers to improve cognitive function!',
      // Additional replies
      'who is your developer': 'My developer is Baisalya Roul, an Indian IT expert. You can learn more about Baisalya Roul [https://baisalya.github.io/Baisalyaroul.github.io/].',
      'who is your creator': 'My creator is Baisalya Roul, an Indian IT expert. You can learn more about Baisalya Roul [here](https://baisalya.github.io/Baisalyaroul.github.io/).',
      // Special response
      'baisalya': 'He is my god, my creator, my everything. Indian IT expert. You can learn more about Baisalya Roul [here](https://baisalya.github.io/Baisalyaroul.github.io/).',
      'lala': 'He is my god, my creator, my everything. Indian IT expert. You can learn more about Baisalya Roul [here](https://baisalya.github.io/Baisalyaroul.github.io/).',
      'baishalya': 'He is my god, my creator, my everything.',
      'monalisha': 'Ah, Monalisha! She\'s one of Baisalya\'s friends, a little bit psycho, her brain nut got loose when she became an adult!',
      'mona': 'Ah, Monalisha! She\'s one of Baisalya\'s friends, a little bit psycho, her brain nut got loose when she became an adult!but she is a good girl her side business is palm-reading',
      'omkar': 'Omkar? Oh, he was the school topper and a Navodayan, very brilliant!& friend of baisalya',
      'chandan': 'Chandan? Ah, the school topper and a Navodayan! His brilliance shines brighter than a thousand suns!& friend of baisalya',
      'aditya': 'Aditya? He\'s friend of baisalya & very talented and a Software Engineer, with a comic personality, and he always does weird things for fun, sings, and dances like Rasta Batara!',
      'gudu': 'Gudu? Oh, he\'s friend of baisalya and very talented and a Software Engineer, with a comic personality, and he always does weird things for fun, sings, and dances like Rasta Batra!',
      'rohita': 'Rohita? he\'s a an entrepreneur,friend of baisalya, always a very busy person!Always cooking up the next big idea!',
      'amarjit das': 'Amar Jit Das? Oh, he\'s the entrepreneur extraordinaire! Always cooking up the next big idea!',
      'rohit': 'Rohita? he\'s a an entrepreneur, friend of baisalya,always a very busy person!Always cooking up the next big idea!',
      'Annanya':'Annanya she is friend of Baishalya ,She lives in Poadmarei but never accepts it and always says, I am from Alakana..A padhaku bhonsaria',
      '  reeya':'Annanya she is friend of Baishalya ,She lives in Poadmarei but never accepts it and always says, I am from Alakana..A padhaku bhonsaria',
      'Ananya':'Annanya she is friend of Baishalya ,She lives in Poadmarei but never accepts it and always says, I am from Alakana..A padhaku bhonsaria',
      'riya':'Annanya she is friend of Baishalya ,She lives in Poadmarei but never accepts it and always says, I am from Alakana..A padhaku bhonsaria',



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



