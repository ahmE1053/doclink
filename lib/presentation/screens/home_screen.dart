import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) => ElevatedButton(
                onPressed: () {
                  // ref
                  //     .read(routerHandlerProvider.notifier)
                  //     .enterNewScreen('specialties');
                  ref.read(authenticationProvider.notifier).signOut();
                  context.go('/auth');
                },
                child: child,
              ),
              child: const Text('Specialties'),
            ),
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipper1(),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(10),
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('hello'),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: CustomClipper2(),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    padding: const EdgeInsets.all(10),
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text('hello 2'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class CustomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
