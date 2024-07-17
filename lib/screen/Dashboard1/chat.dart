// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import "package:service/export.dart";

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];
  TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Appbar Back Button
            MyAppBarBackButton(),
            SizedBox(
              width: 10,
            ),
            // Circular Avtar & image
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 217, 217, 217),
                  radius: MediaQuery.of(context).size.width < 400 ? 18 : 22,
                  child: Image.asset(
                    profileImage,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            // providers name
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                MySecondHeading(
                  text: providersName,
                  fontsize: MediaQuery.of(context).size.width < 400 ? 14 : 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyDescTextWidget(
                      text: 'Online',
                      fontSize:
                          MediaQuery.of(context).size.width < 400 ? 9 : 10,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: Colors.green,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            // green tick
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 18,
                ),
                Image.asset(
                  greenVerifiedTick,
                  width: MediaQuery.of(context).size.width < 400 ? 10 : 14,
                  height: MediaQuery.of(context).size.width < 400 ? 10 : 14,
                ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            // call icon
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.call,
                  size: MediaQuery.of(context).size.width < 400 ? 25 : 30,
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
