import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:quiz_app/screens/result_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF252c4a);
  Color SecondColor = Color(0xFF117eeb);
  // page controller for page view
  PageController? _controller = PageController(initialPage: 0);
  // quiz variables
  bool isPressesd = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: PageView.builder(
            // disable the scrolling the page
            physics: NeverScrollableScrollPhysics(),
            controller: _controller!,
            onPageChanged: (page) {
              setState(() {
                isPressesd = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/${questions.length}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 8.0,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    questions[index].question!,
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  for (int i = 0; i < questions[index].answers!.length; i++)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 18),
                      child: MaterialButton(
                          shape: StadiumBorder(),
                          color: isPressesd
                              ? questions[index]
                                      .answers!
                                      .entries
                                      .toList()[i]
                                      .value
                                  ? isTrue
                                  : isWrong
                              : SecondColor,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          onPressed: isPressesd
                              ? () {}
                              : () {
                                  setState(() {
                                    isPressesd = true;
                                  });
                                  if (questions[index]
                                      .answers!
                                      .entries
                                      .toList()[i]
                                      .value) {
                                    score += 10;
                                    print(score);
                                  }
                                },
                          child: Text(
                            questions[index].answers!.keys.toList()[i],
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          onPressed: isPressesd
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Resultscreen(score)));
                                    }
                                  : () {
                                      _controller!.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                      setState(() {
                                        isPressesd = false;
                                      });
                                    }
                              : null,
                          style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                              side: BorderSide(color: Colors.orange, width: 1)),
                          child: Text(
                            index + 1 == questions.length
                                ? "see results"
                                : "Next Question",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
