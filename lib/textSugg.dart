import 'package:flutter/material.dart';
import 'package:ori/consts/const.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSuggestion extends StatefulWidget {
  const TextSuggestion({super.key});

  @override
  State<TextSuggestion> createState() => _TextSuggestionState();
}

class _TextSuggestionState extends State<TextSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home/', (route) => false);
              },
              icon: Icon(Icons.home))
        ],
        title: Text(
          'Text instructions',
          style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[700]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  TypeWriter.text(
                    style: GoogleFonts.robotoSlab(fontSize: 25),
                    content[contentIndex],
                    duration: const Duration(milliseconds: 5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
