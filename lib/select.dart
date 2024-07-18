import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ori/consts/const.dart';
import 'package:youtube_api/youtube_api.dart';

class ChooseOption extends StatefulWidget {
  const ChooseOption({super.key});

  @override
  State<ChooseOption> createState() => _ChooseOptionState();
}

class _ChooseOptionState extends State<ChooseOption> {
  String prompt = '$w origami tutorials';
  YoutubeAPI yt =
      YoutubeAPI(dotenv.env['token'].toString(), maxResults: 6, type: "video");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Ori', style: GoogleFonts.robotoSlab()),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/home/', (route) => false);
                  },
                  icon: Icon(Icons.home))
            ],
          ),
          backgroundColor: Colors.grey,
          body: Center(
            child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/textsug/');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 60,
                      width: 120,
                      child: Center(
                        child: Text(
                          'Text based Instructions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        results = await yt.search(prompt);
                      } catch (e) {
                        print(e);
                      }
                      Navigator.of(context).pushNamed('/final/');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 60,
                      width: 120,
                      child: Center(
                        child: Text(
                          'Youtube Suggestions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
