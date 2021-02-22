import 'package:flutter/material.dart';
import 'introcontent.dart';
import 'defaultbutton.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Map<String, String>> introData = [
    {"text": "Welcome to roveassist app.", "image": "assets/0.png"},
    {
      "text": "Never let your memories \nbe greater than your dream.",
      "image": "assets/1.png"
    },
    {"text": "Travel is an investment in yourself.", "image": "assets/2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: introData.length,
                itemBuilder: (context, index) => IntroContent(
                  text: introData[index]["text"],
                  image: introData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(),
                    defaulButton(
                      text: "Next",
                      press: () {
                        pageController.animateToPage(
                            currentPage == introData.length - 1
                                ? 0
                                : currentPage + 1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.redAccent : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
