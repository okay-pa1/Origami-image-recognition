import 'package:flutter/material.dart';
import 'package:ori/consts/const.dart';



class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 90, 85, 85),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
          return [
            const SliverAppBar(
              title: Center(child: Text('Select video')),
              backgroundColor: Color.fromARGB(255, 138, 27, 27),
            )
          ];
        },
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
            center: Alignment.center,
            radius: 1,
            colors: [Color.fromARGB(255, 97, 92, 92),Color.fromARGB(255, 29, 21, 21)]
          )
          ),
          child: ListView.builder(itemCount: 6,itemBuilder: (BuildContext context,int index){
          return Padding(
          padding: const EdgeInsets.fromLTRB(10, 20,10, 20),
          child: InkWell(
            onTap: (){
              mainindex=index;
              Navigator.of(context).pushNamedAndRemoveUntil('/player/', (route) => false);
            },
            child: Container(
              decoration: const BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 116, 110, 110)
                    ),
              height: 300,
              width: 500,
              child: Column(  
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 200,
                    width: 490,
                    child: ClipRRect(
                      borderRadius: const BorderRadiusDirectional.only(topEnd:Radius.circular(20),topStart: Radius.circular(20)),
                      child: Image.network(results[index].thumbnail.medium.url.toString(),fit: BoxFit.cover,),
                    )
                  ),
                  Padding(
                    padding:  const EdgeInsets.fromLTRB(10, 8,0,1),
                    child:  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        results[index].title.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 2,0,2),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(results[index].channelTitle.toString()),
                    ),
                  )
              ]),
            ),
          )
              );
              }),
        ),
      ),
    );
  }
}