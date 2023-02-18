import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hard_music_1/screen/provider/Music_Provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioProvider? providerT;
  AudioProvider? providerF;

  @override
  void initState() {
    super.initState();
    Provider.of<AudioProvider>(context, listen: false).loadAudio();
  }

  Widget build(BuildContext context) {
    providerT = Provider.of<AudioProvider>(context, listen: true);
    providerF = Provider.of<AudioProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("🎧HARD-MUSIC"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: providerF!.m1.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  providerF!.AddData(providerF!.m1[index], index);
                  providerF!.changesongPath(providerT!.m1[index].music);
                  Navigator.pushNamed(context, 'Music');
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: providerF!.m1[index].color,
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("${providerF!.m1[index].image}",),
                      ),
                      title: Text(
                        "${providerF!.m1[index].name}",
                        style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${providerF!.m1[index].singer}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      trailing: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
