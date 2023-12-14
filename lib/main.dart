import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:ori/check.dart';
import 'package:ori/consts/const.dart';
import 'dart:async';
import 'package:ori/final.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ori/player.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

 
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main()async { 
   HttpOverrides.global = MyHttpOverrides();
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized;
  await dotenv.load();
  runApp(const MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Lottie.asset('assets/swan.json'),
        backgroundColor: Colors.transparent,
        nextScreen: const HomePage(),
      splashIconSize: 300,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ORI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/check/': (context) => const CheckPage(),
        '/home/':(context) => const HomePage(),
        '/final/':(context) => const FinalPage(),
        '/player/':(context) => const Player()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  
  @override
  void initState() {
    super.initState();
    image=File('/assets/6.jpg');
    loadmodel();
  }
  @override
  void dispose(){
    super.dispose();
  }

  loadmodel(){
    Tflite.loadModel(model: 'assets/model_unquant.tflite',labels: 'assets/labels.txt');
  }

  classify(File image)async{
    var output=await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    return output;
  }

  Future<File?> getimg()async {
    return image;
  }

  pick(ImageSource src)async{
    var img=await ImagePicker().pickImage(source: src);
    image=File(img!.path);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20,20, 20),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  onTap: ()async{
                    var img=await pick(ImageSource.camera);
                var output=await classify(img);
                setState(() {
                  w=output[0]["label"].toString();
                });
                Navigator.of(context).pushNamedAndRemoveUntil('/check/', (route) => false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.grey.shade100.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 150,
                    width: 150,
                    child: Icon(Icons.camera_alt_outlined,size: 100,)
                  ),
                ),
              ),
              Text('Click from camera'),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20,20, 20),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  onTap: ()async{
                    var img=await pick(ImageSource.gallery);
                var output=await classify(img);
                setState(() {
                  w=output[0]["label"].toString();
                });
                Navigator.of(context).pushNamedAndRemoveUntil('/check/', (route) => false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.grey.shade100.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 150,
                    width: 150,
                    child: Icon(Icons.broken_image_outlined,size: 100,)
                  ),
                ),
              ),
                const Text('Select from Gallery',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                  ),
                ),
                             
            ],
          ),
        ),
      ),
    );
  }
}



