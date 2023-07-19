import 'package:flutter/material.dart';
import 'package:quiz_app/Homepage.dart';

class Resultscreen extends StatefulWidget {
  final int score;
  const Resultscreen(this.score, {Key? key}) : super(key: key);

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF252c4a);
    Color SecondColor = Color(0xFF117eeb);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulations",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Your Score is:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${widget.score}",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("Repeat the Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
