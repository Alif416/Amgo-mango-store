import 'package:flutter/material.dart';
import 'package:myapp/constants/global_variables.dart';
import 'package:myapp/features/account/widgets/below_app_bar.dart';
import 'package:myapp/features/account/widgets/orders.dart';
import 'package:myapp/features/account/widgets/top_buttons.dart';
import 'package:myapp/features/chatbot/chatbot_screen.dart';
import 'package:myapp/features/search_delegate/my_search_screen.dart';
import 'package:myapp/main.dart';



class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalVariables.getAppBar(
          context: context,
          wantBackNavigation: false,
          title: "Your Account",
          onClickSearchNavigateTo: MySearchScreen()),
      body: Column(
        children: [
          SizedBox(height: mq.width * .025),
          const BelowAppBar(),
          SizedBox(height: mq.width * .025),
          TopButtons(),
          SizedBox(height: mq.width * .045),
          const Orders(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        icon: const Icon(Icons.chat_bubble_outline_outlined),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const ChatbotScreen()));
        },
        backgroundColor: Colors.deepPurple.shade600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        label: const Text("Ask buddy", style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
