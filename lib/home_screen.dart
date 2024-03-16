import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
    this.switchScreen, {
    super.key,
  });

  final void Function() switchScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png'),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Learn Flutter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 45, 46, 46),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
              //   style: OutlinedButton.styleFrom(
              //     foregroundColor: Colors.blue,

              //   ),
              icon: const Icon(
                Icons.arrow_circle_right,
                color: Color.fromARGB(255, 94, 147, 216),
              ),
              onPressed: widget.switchScreen,
              label: const Text(
                'start learn!',
                style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 3, 3)),
              )),
        ],
      ),
    );
  }
}
