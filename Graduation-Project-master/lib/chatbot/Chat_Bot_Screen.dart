import 'package:flutter/material.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          title: const Text(
            'محادثة',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Text(
                        'Today, 04:12 pm',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  ChatBubble(
                    text: 'مرحبا',
                    isSender: false,
                  ),
                  ChatBubble(
                    text: 'أهلا',
                    isSender: true,
                    avatar: true,
                  ),
                  ChatBubble(
                    text: 'كيف يمكنني مساعدتك؟',
                    isSender: false,
                  ),
                  ChatBubble(
                    text: 'أشعر بالحزن الشديد',
                    isSender: true,
                    avatar: true,
                  ),
                  ChatBubble(
                    text:
                        '''وظيفة الحزن هي أن يخبرك أنك فقدت شيئاً ما لكن أيضاً بمساعدتك على احترام وتقدير كل الأمور الجيدة الباقية لك. كما أن الحزن يعد تقنية وآلية من آليات المواجهة والتغلب والتي تساعدك في الحصول على الدعم المجتمعي من العائلة والأصدقاء. تذكر أن الشخص عندما يكون حزيناً يعود عادةً الأطفال والأصدقاء حيث هو الدعم والتشجيع. كما أن الحزن يساعدك على إعادة تقييم أهدافك ومعنى في الحياة وهذا يؤدي إلى الاستمتاع بحياة أكثر متعة ووجدان.''',
                    isSender: false,
                    isLong: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'اكتب هنا',
                      suffixIcon: const Icon(Icons.send),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool avatar;
  final bool isLong;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    this.avatar = false,
    this.isLong = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isSender)
              const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/chatbotim.png')),
            if (!isSender) const SizedBox(width: 7),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isSender ? Colors.white : Colors.black38),
                  color: isSender ? const Color(0xff205D55) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSender ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            if (isSender && avatar)
              const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
            if (isSender && avatar)
              const SizedBox(
                width: 7,
              )
          ],
        ),
      ),
    );
  }
}
