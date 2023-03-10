import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   // stops: [
            //   // 0.1,
            //   // 0.4,
            //   // 0.6,
            //   // 0.9,
            //   // ],
            //   colors: [
            //     Theme.of(context).colorScheme.secondary,
            //     Theme.of(context).colorScheme.primary,
            //     // Theme.of(context).colorScheme.tertiary,
            //   ],
            // ),
            color: Theme.of(context).colorScheme.background),
        child: Center(
          child: SpinKitRipple(
            color: Theme.of(context).colorScheme.primary,
            size: 150,
          ),
        ),
      ),
    );
  }
}
