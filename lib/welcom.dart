import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'duration.dart';
import 'navbar.dart';
const d_red = const Color(0xFFE9717D);
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30
          ),
          child: Column(
            children: [
              Home(
                dalay: 1500,
                child: Container(
                  height: 100,
                  child: Image.asset("assets/images/step.png"),
                ),
                
              ),
              Home(
                dalay: 2500,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 70
                  ),
                  height: 258.5,
                  width: 300,
                  child: Image.asset("assets/images/image.png"),
                ),
                
              )
              
              
            ],
          )
        ),
      ),
    );
  }
}