import 'package:flutter/material.dart';
import 'package:ori/consts/const.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  String prompt='$w origami tutorials';
  YoutubeAPI yt = YoutubeAPI(dotenv.env['token'].toString(), maxResults: 6, type: "video");

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: FileImage(image),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text('Is this a'),
                Text('$w?'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: TextButton(
                          onPressed: ()async{
                            try {
                                results = await yt.search(prompt);
                            } catch (e) {
                                print(e);
                             }
                            Navigator.of(context).pushNamedAndRemoveUntil('/final/', (route) => false);
                          }, 
                          child: Text('Yes'))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).pushNamedAndRemoveUntil('/home/', (route) => false);
                          }, 
                          child: const Text('No'))
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

