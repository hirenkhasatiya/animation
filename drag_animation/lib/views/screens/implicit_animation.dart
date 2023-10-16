import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            // TweenAnimationBuilder(
            //   tween: Tween(begin: 100.0, end: 400.0),
            //   duration: Duration(seconds: 4),
            //   curve: Curves.bounceInOut,
            //   builder: (context, value, child) => Center(
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.green,
            //         shape: BoxShape.circle,
            //       ),
            //       height: value,
            //       width: value,
            //     ),
            //   ),
            // ),
            // TweenAnimationBuilder(
            //     tween: Tween(begin: 0.0, end: 90.0),
            //     duration: Duration(seconds: 4),
            //     curve: Curves.bounceInOut,
            //     builder: (context, value, child) => Center(
            //           child: Opacity(
            //             opacity: value / 100,
            //             child: Text(
            //               "Hello World",
            //               style: TextStyle(
            //                   fontSize: value - 20, color: Colors.white),
            //             ),
            //           ),
            //         )),
            // TweenAnimationBuilder(
            //   tween: Tween(begin: 0.0, end: 230.0),
            //   duration: Duration(seconds: 2),
            //   curve: Curves.bounceOut,
            //   builder: (context, value, child) => Center(
            //     child: AnimatedContainer(
            //       curve: Curves.bounceIn,
            //       duration: Duration(seconds: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.red.shade50,
            //         shape: BoxShape.circle,
            //       ),
            //       height: value,
            //       width: value,
            //     ),
            //   ),
            // ),
            // TweenAnimationBuilder(
            //   tween: Tween(begin: 0.0, end: 200.0),
            //   duration: Duration(seconds: 2),
            //   curve: Curves.bounceIn,
            //   builder: (context, value, child) => Center(
            //     child: AnimatedContainer(
            //       curve: Curves.bounceIn,
            //       duration: Duration(seconds: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.red.shade100,
            //         shape: BoxShape.circle,
            //       ),
            //       height: value,
            //       width: value,
            //     ),
            //   ),
            // ),
            // TweenAnimationBuilder(
            //   tween: Tween(begin: 0.0, end: 170.0),
            //   duration: Duration(seconds: 2),
            //   curve: Curves.bounceOut,
            //   builder: (context, value, child) => Center(
            //     child: AnimatedContainer(
            //       curve: Curves.bounceIn,
            //       duration: Duration(seconds: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.red.shade200,
            //         shape: BoxShape.circle,
            //       ),
            //       height: value,
            //       width: value,
            //     ),
            //   ),
            // ),
            // TweenAnimationBuilder(
            //   tween: Tween(begin: 0.0, end: 140.0),
            //   duration: Duration(seconds: 2),
            //   curve: Curves.bounceIn,
            //   builder: (context, value, child) => Center(
            //     child: AnimatedContainer(
            //       curve: Curves.bounceIn,
            //       duration: Duration(seconds: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.red.shade300,
            //         shape: BoxShape.circle,
            //       ),
            //       height: value,
            //       width: value,
            //     ),
            //   ),
            // ),
            // TweenAnimationBuilder(
            //   tween: Tween(begin: 0.0, end: 110.0),
            //   duration: Duration(seconds: 2),
            //   curve: Curves.bounceOut,
            //   builder: (context, value, child) => Center(
            //     child: AnimatedContainer(
            //       curve: Curves.bounceIn,
            //       duration: Duration(seconds: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.red.shade400,
            //         shape: BoxShape.circle,
            //       ),
            //       height: value,
            //       width: value,
            //     ),
            //   ),
            // ),
            // TweenAnimationBuilder(
            //   tween: Tween(begin: 0.0, end: 70.0),
            //   duration: Duration(seconds: 2),
            //   curve: Curves.bounceIn,
            //   builder: (context, value, child) => Center(
            //     child: AnimatedContainer(
            //       curve: Curves.bounceIn,
            //       duration: Duration(seconds: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.red.shade500,
            //         shape: BoxShape.circle,
            //       ),
            //       height: value,
            //       width: value,
            //     ),
            //   ),
            // ),
            TweenAnimationBuilder(
              tween: Tween(begin: -1.1, end: 0.0),
              duration: Duration(seconds: 2),
              curve: Curves.bounceOut,
              builder: (context, value, child) => Center(
                child: Align(
                  alignment: AlignmentDirectional(value, value),
                  child: AnimatedContainer(
                    curve: Curves.bounceIn,
                    duration: Duration(seconds: 2),
                    decoration: BoxDecoration(
                      color: Colors.red.shade500,
                      shape: BoxShape.circle,
                    ),
                    height: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
