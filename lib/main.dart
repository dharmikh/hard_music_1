import 'package:flutter/material.dart';
import 'package:hard_music_1/screen/provider/Music_Provider.dart';
import 'package:hard_music_1/screen/view/Home_Page.dart';
import 'package:hard_music_1/screen/view/Home2_page.dart';

import 'package:provider/provider.dart';
void main()
{
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AudioProvider(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/':(context) => HomePage(),
            'Music':(context) => MusicPage()
          },
        ),
      )
  );
}