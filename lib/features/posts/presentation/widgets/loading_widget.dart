import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

late AnimationController controller;

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 400),
    // )..repeat(reverse: true);

    // controller.forward();
  }

  @override
  void dispose() {
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText("Loading...",
                textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20),
                colors: [
                
               
                  Theme.of(context).colorScheme.primary,
                   Colors.blueAccent, 
                  Theme.of(context).colorScheme.onSecondaryContainer,
                ],
                speed: const Duration(milliseconds: 200),),
            // TypewriterAnimatedText("Loading............",
            //     speed: const Duration(milliseconds: 300),
            //     textStyle:
            //         TextStyle(color: Theme.of(context).colorScheme.primary)),
          ],
        )
      ],
    );
  }
}
