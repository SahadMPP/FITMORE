import 'package:e_commerce/Widgets/bottom_navigator.dart';
import 'package:e_commerce/Widgets/splash_content.dart';
import 'package:flutter/material.dart';

class SecondSp extends StatefulWidget {
  const SecondSp({super.key});

  @override
  State<SecondSp> createState() => _SecondSpState();
}

class _SecondSpState extends State<SecondSp> {
  int crrentpage = 0;
  List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to MenCart,Lets shop!',
      'image': 'asset/splash_1.png',
    },
    {
      'text': 'Welcome help people conect with state of America',
      'image': 'asset/splash_2.png',
    },
    {
      'text': 'We show the easy way to shop. \njust stay at home with us',
      'image': 'asset/splash_3.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      crrentpage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => Splashcontent(
                      text: splashData[index]['text'],
                      image: splashData[index]["image"]),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // botton............
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 145, 0),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const BottomNavigator(),
                      ));
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: crrentpage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: crrentpage == index
            ? const Color.fromARGB(255, 232, 138, 16)
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
