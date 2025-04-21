import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/INTJ.dart';
import 'package:gradution_project/chatbot/Chat_Bot_Screen.dart';
import 'package:gradution_project/core/settings/Edit_Profil.dart';
import 'package:gradution_project/core/settings/Setting_Screen.dart';
import 'package:gradution_project/core/settings/Setting_condition.dart';
import 'package:gradution_project/core/settings/Setting_privacy.dart';
import 'package:gradution_project/core/settings/setting_who.dart';
import 'intro_screen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      startLocale: const Locale('ar'),
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: const Locale('ar'),
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp( localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale ,

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(

        
        useMaterial3: true,
      ),
      home:  const ChatBotScreen(),
    );
  }
}
